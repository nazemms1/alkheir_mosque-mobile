import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../core/config/attendance_config.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/services/admin_service.dart';

// ─────────────────────────────────────────────────────────────────────────────
// نتيجة مسح QR — يُفترض أن يحتوي رمز QR الخاص بالطالب على معرّفه (student_id)
// مباشرة أو ضمن رابط/JSON بسيط.
// ─────────────────────────────────────────────────────────────────────────────
class QrScanResult {
  final String raw;          // المحتوى الخام من الـ QR
  final String? studentName;
  final String? studentId;
  const QrScanResult({required this.raw, this.studentName, this.studentId});

  factory QrScanResult.fromRaw(String raw) {
    try {
      final uri = Uri.tryParse(raw);
      if (uri != null && uri.queryParameters.isNotEmpty) {
        return QrScanResult(
          raw: raw,
          studentId: uri.queryParameters['student_id'] ?? uri.queryParameters['id'],
          studentName: uri.queryParameters['name'],
        );
      }
    } catch (_) {}
    // fallback — نعامل المحتوى كـ student_id مباشرة
    return QrScanResult(raw: raw, studentId: raw.trim());
  }
}

/// نوع حالة الحضور المختارة قبل بدء المسح
enum ScanAttendanceKind { present, late }

extension on ScanAttendanceKind {
  String get statusId => this == ScanAttendanceKind.present
      ? AttendanceConfig.presentStatusId
      : AttendanceConfig.lateStatusId;
  String get label => this == ScanAttendanceKind.present ? 'حضور' : 'تأخر';
  IconData get icon => this == ScanAttendanceKind.present
      ? Icons.check_circle_rounded
      : Icons.schedule_rounded;
}

// ─────────────────────────────────────────────────────────────────────────────
// شاشة مسح QR الرئيسية
// ─────────────────────────────────────────────────────────────────────────────
class QrScannerScreen extends StatefulWidget {
  final int? groupId;      // اختياري — إذا عُرف مسبقاً يُستخدم كحلقة التسجيل
  final String? groupName;
  const QrScannerScreen({super.key, this.groupId, this.groupName});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen>
    with SingleTickerProviderStateMixin {
  final MobileScannerController _scanner = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
  );
  final _service = AdminService();

  bool _torchOn   = false;
  bool _paused    = false;
  bool _sending   = false;
  ScanAttendanceKind? _kind; // null = لم يُختر النوع بعد

  // سجل الحضور المُسجَّل في هذه الجلسة
  final List<_AttendanceRecord> _sessionRecords = [];

  @override
  void dispose() {
    _scanner.dispose();
    super.dispose();
  }

  void _toggleTorch() {
    _scanner.toggleTorch();
    setState(() => _torchOn = !_torchOn);
  }

  void _togglePause() {
    if (_paused) {
      _scanner.start();
    } else {
      _scanner.stop();
    }
    setState(() => _paused = !_paused);
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    final barcode = capture.barcodes.firstOrNull;
    if (barcode == null || barcode.rawValue == null) return;
    if (_sending || _paused || _kind == null) return;

    final raw = barcode.rawValue!;
    HapticFeedback.mediumImpact();
    _scanner.stop();
    setState(() { _sending = true; _paused = true; });

    final result = QrScanResult.fromRaw(raw);
    await _submitAttendance(result);
  }

  Future<void> _submitAttendance(QrScanResult result) async {
    final displayName = result.studentName ?? result.studentId ?? result.raw;
    try {
      final studentId = int.tryParse(result.studentId ?? '');
      if (studentId == null) {
        throw Exception('رمز QR غير صالح');
      }

      final enrollments = await _service.fetchEnrollments(
        studentId: studentId,
        status: 'active',
        perPage: 5,
      );
      if (enrollments.items.isEmpty) {
        throw Exception('لا يوجد تسجيل نشط لهذا الطالب');
      }
      final enrollment = enrollments.items.first;
      final groupId = widget.groupId ?? enrollment.groupId;

      final now = DateTime.now();
      final attendanceDate =
          '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

      await _service.recordGroupAttendance(
        groupId: groupId,
        enrollmentId: enrollment.id,
        attendanceStatusId: _kind!.statusId,
        attendanceDate: attendanceDate,
      );

      if (!mounted) return;
      final record = _AttendanceRecord(
        studentName: enrollment.studentName.isNotEmpty ? enrollment.studentName : displayName,
        time: now,
        status: _RecordStatus.success,
      );
      setState(() {
        _sessionRecords.insert(0, record);
        _sending = false;
      });
      _showFeedback(success: true, name: record.studentName);

    } catch (e) {
      if (!mounted) return;
      final record = _AttendanceRecord(
        studentName: displayName,
        time: DateTime.now(),
        status: _RecordStatus.error,
        error: e.toString(),
      );
      setState(() {
        _sessionRecords.insert(0, record);
        _sending = false;
      });
      _showFeedback(success: false, name: record.studentName, error: e.toString());
    }
  }

  void _showFeedback({required bool success, required String name, String? error}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 120),
        backgroundColor: success ? AppColors.success : AppColors.error,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        duration: const Duration(seconds: 3),
        content: Row(
          children: [
            Icon(
              success ? Icons.check_circle_rounded : Icons.error_rounded,
              color: Colors.white,
              size: 22,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    success ? 'تم تسجيل الحضور' : 'فشل التسجيل',
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    success ? name : (error ?? name),
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // استئناف المسح بعد 2 ثانية
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && _paused) {
        _scanner.start();
        setState(() => _paused = false);
      }
    });
  }

  void _selectKind(ScanAttendanceKind kind) {
    setState(() => _kind = kind);
  }

  @override
  Widget build(BuildContext context) {
    if (_kind == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: _AttendanceKindPicker(
          groupName: widget.groupName,
          onSelected: _selectKind,
          onClose: () => Navigator.pop(context),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ── Camera view ────────────────────────────────────────────────
          if (!_paused || _sending)
            MobileScanner(
              controller: _scanner,
              onDetect: _onDetect,
            ),
          if (_paused && !_sending)
            Container(color: Colors.black87),

          // ── Overlay (viewfinder + controls) ────────────────────────────
          _ScanOverlay(
            groupName: widget.groupName,
            kind: _kind!,
            torchOn: _torchOn,
            paused: _paused,
            sending: _sending,
            onToggleTorch: _toggleTorch,
            onTogglePause: _togglePause,
            onChangeKind: () => setState(() => _kind = null),
            onClose: () => Navigator.pop(context),
          ),

          // ── Session records panel ──────────────────────────────────────
          if (_sessionRecords.isNotEmpty)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _SessionPanel(records: _sessionRecords),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// شاشة اختيار نوع الحضور قبل بدء المسح
// ─────────────────────────────────────────────────────────────────────────────
class _AttendanceKindPicker extends StatelessWidget {
  final String? groupName;
  final ValueChanged<ScanAttendanceKind> onSelected;
  final VoidCallback onClose;
  const _AttendanceKindPicker({
    required this.groupName,
    required this.onSelected,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                _CircleBtn(icon: Icons.close_rounded, onTap: onClose),
                const Spacer(),
                if (groupName != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Text(
                      groupName!,
                      style: const TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Cairo', fontWeight: FontWeight.w700),
                    ),
                  ),
                const Spacer(),
                const SizedBox(width: 44),
              ],
            ),
            const Spacer(),
            Icon(Icons.qr_code_scanner_rounded, size: 64, color: Colors.white.withOpacity(0.5)),
            const SizedBox(height: 20),
            const Text(
              'اختر نوع الحضور قبل بدء المسح',
              style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Cairo', fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 32),
            _KindButton(
              kind: ScanAttendanceKind.present,
              onTap: () => onSelected(ScanAttendanceKind.present),
            ),
            const SizedBox(height: 14),
            _KindButton(
              kind: ScanAttendanceKind.late,
              onTap: () => onSelected(ScanAttendanceKind.late),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

class _KindButton extends StatelessWidget {
  final ScanAttendanceKind kind;
  final VoidCallback onTap;
  const _KindButton({required this.kind, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = kind == ScanAttendanceKind.present ? AppColors.success : AppColors.gold;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withOpacity(0.5), width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(kind.icon, color: color, size: 24),
            const SizedBox(width: 10),
            Text(
              kind.label,
              style: TextStyle(color: color, fontSize: 16, fontFamily: 'Cairo', fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Overlay (viewfinder + controls)
// ─────────────────────────────────────────────────────────────────────────────
class _ScanOverlay extends StatelessWidget {
  final String? groupName;
  final ScanAttendanceKind kind;
  final bool torchOn, paused, sending;
  final VoidCallback onToggleTorch, onTogglePause, onChangeKind, onClose;
  const _ScanOverlay({
    required this.groupName,
    required this.kind,
    required this.torchOn,
    required this.paused,
    required this.sending,
    required this.onToggleTorch,
    required this.onTogglePause,
    required this.onChangeKind,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Top bar ──────────────────────────────────────────────────────
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _CircleBtn(icon: Icons.close_rounded, onTap: onClose),
                const Spacer(),
                if (groupName != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Text(
                      groupName!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                const Spacer(),
                _CircleBtn(
                  icon: torchOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
                  onTap: onToggleTorch,
                  active: torchOn,
                ),
              ],
            ),
          ),
        ),

        // ── Attendance kind badge ────────────────────────────────────────
        GestureDetector(
          onTap: sending ? null : onChangeKind,
          child: Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: (kind == ScanAttendanceKind.present ? AppColors.success : AppColors.gold).withOpacity(0.18),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: (kind == ScanAttendanceKind.present ? AppColors.success : AppColors.gold).withOpacity(0.5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(kind.icon, size: 16, color: kind == ScanAttendanceKind.present ? AppColors.success : AppColors.gold),
                const SizedBox(width: 6),
                Text(
                  'تسجيل: ${kind.label}',
                  style: TextStyle(
                    color: kind == ScanAttendanceKind.present ? AppColors.success : AppColors.gold,
                    fontSize: 12.5,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(Icons.edit_rounded, size: 13, color: Colors.white.withOpacity(0.6)),
              ],
            ),
          ),
        ),

        const Spacer(),

        // ── Viewfinder ───────────────────────────────────────────────────
        Center(
          child: _Viewfinder(sending: sending, paused: paused),
        ),

        const SizedBox(height: 28),

        // ── Hint text ────────────────────────────────────────────────────
        Text(
          sending
              ? 'جارٍ تسجيل الحضور...'
              : paused
                  ? 'المسح متوقف مؤقتاً'
                  : 'وجّه الكاميرا نحو رمز QR الطالب',
          style: TextStyle(
            color: sending
                ? AppColors.gold
                : paused
                    ? Colors.white60
                    : Colors.white,
            fontSize: 14,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 24),

        // ── Pause / Resume button ─────────────────────────────────────────
        if (!sending)
          GestureDetector(
            onTap: onTogglePause,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
              decoration: BoxDecoration(
                color: paused ? AppColors.primaryLight : Colors.white24,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: paused ? AppColors.primaryLight : Colors.white38,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    paused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    paused ? 'استئناف المسح' : 'إيقاف مؤقت',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),

        const SizedBox(height: 180),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Viewfinder مربع الاستهداف
// ─────────────────────────────────────────────────────────────────────────────
class _Viewfinder extends StatefulWidget {
  final bool sending, paused;
  const _Viewfinder({required this.sending, required this.paused});

  @override
  State<_Viewfinder> createState() => _ViewfinderState();
}

class _ViewfinderState extends State<_Viewfinder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scan;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _scan = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.68;
    final color = widget.sending
        ? AppColors.gold
        : widget.paused
            ? Colors.white38
            : AppColors.primaryLight;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Semi-transparent background
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: color.withOpacity(0.5), width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          // Corner brackets
          ..._corners(size, color),
          // Scan line animation
          if (!widget.paused && !widget.sending)
            AnimatedBuilder(
              animation: _scan,
              builder: (_, __) => Positioned(
                top: (_scan.value * (size - 4)).clamp(2, size - 4),
                left: 12,
                right: 12,
                child: Container(
                  height: 2.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        color.withOpacity(0.8),
                        color,
                        color.withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          // Sending spinner
          if (widget.sending)
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.gold,
                strokeWidth: 3,
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _corners(double size, Color color) {
    const len = 28.0;
    const w = 3.5;
    const r = 20.0;
    return [
      // Top-right
      Positioned(top: 0, right: 0,
        child: _Corner(len: len, w: w, r: r, color: color, top: true, right: true)),
      // Top-left
      Positioned(top: 0, left: 0,
        child: _Corner(len: len, w: w, r: r, color: color, top: true, right: false)),
      // Bottom-right
      Positioned(bottom: 0, right: 0,
        child: _Corner(len: len, w: w, r: r, color: color, top: false, right: true)),
      // Bottom-left
      Positioned(bottom: 0, left: 0,
        child: _Corner(len: len, w: w, r: r, color: color, top: false, right: false)),
    ];
  }
}

class _Corner extends StatelessWidget {
  final double len, w, r;
  final Color color;
  final bool top, right;
  const _Corner({required this.len, required this.w, required this.r,
    required this.color, required this.top, required this.right});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: len,
      height: len,
      child: CustomPaint(painter: _CornerPainter(color: color, w: w, r: r, top: top, right: right)),
    );
  }
}

class _CornerPainter extends CustomPainter {
  final Color color;
  final double w, r;
  final bool top, right;
  const _CornerPainter({required this.color, required this.w, required this.r, required this.top, required this.right});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = w
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    final dx = right ? size.width : 0.0;
    final dy = top ? 0.0 : size.height;
    final sx = right ? -1.0 : 1.0;
    final sy = top ? 1.0 : -1.0;

    path.moveTo(dx, dy + sy * r);
    path.quadraticBezierTo(dx, dy, dx + sx * r, dy);
    path.lineTo(dx + sx * size.width * 0.85, dy);
    path.moveTo(dx, dy + sy * r);
    path.lineTo(dx, dy + sy * size.height * 0.85);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CornerPainter old) => old.color != color;
}

// ─────────────────────────────────────────────────────────────────────────────
// Session records panel (أسفل الشاشة)
// ─────────────────────────────────────────────────────────────────────────────
enum _RecordStatus { success, error }

class _AttendanceRecord {
  final String studentName;
  final DateTime time;
  final _RecordStatus status;
  final String? error;
  const _AttendanceRecord({
    required this.studentName,
    required this.time,
    required this.status,
    this.error,
  });
}

class _SessionPanel extends StatelessWidget {
  final List<_AttendanceRecord> records;
  const _SessionPanel({required this.records});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 180),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: const Border(top: BorderSide(color: Colors.white12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                const Icon(Icons.history_rounded, color: Colors.white60, size: 16),
                const SizedBox(width: 6),
                const Text(
                  'سجل الجلسة',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${records.length}',
                    style: const TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 12,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              itemCount: records.length,
              itemBuilder: (_, i) => _RecordTile(record: records[i])
                  .animate()
                  .fadeIn(duration: 250.ms)
                  .slideY(begin: -0.1, end: 0, duration: 250.ms),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecordTile extends StatelessWidget {
  final _AttendanceRecord record;
  const _RecordTile({required this.record});

  @override
  Widget build(BuildContext context) {
    final ok = record.status == _RecordStatus.success;
    final color = ok ? AppColors.success : AppColors.error;
    final timeStr =
        '${record.time.hour.toString().padLeft(2, '0')}:${record.time.minute.toString().padLeft(2, '0')}';
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Icon(
            ok ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: color,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              record.studentName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            timeStr,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// زر دائري مساعد
// ─────────────────────────────────────────────────────────────────────────────
class _CircleBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool active;
  const _CircleBtn({required this.icon, required this.onTap, this.active = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: active ? AppColors.gold.withOpacity(0.25) : Colors.black54,
          shape: BoxShape.circle,
          border: Border.all(
            color: active ? AppColors.gold : Colors.white24,
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          color: active ? AppColors.gold : Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
