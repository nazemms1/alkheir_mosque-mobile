import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:alkheir_mosque/app/core/config/attendance_config.dart';
import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/data/repositories/admin_repository_impl.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';

// ─────────────────────────────────────────────────────────────────────────────
// نتيجة مسح QR — يُفترض أن يحتوي رمز QR الخاص بالطالب على معرّفه (student_id)
// مباشرة أو ضمن رابط/JSON بسيط.
// ─────────────────────────────────────────────────────────────────────────────
class QrScanResult {
  final String raw; // المحتوى الخام من الـ QR
  final String? studentName;
  final String? studentId;
  const QrScanResult({required this.raw, this.studentName, this.studentId});

  factory QrScanResult.fromRaw(String raw) {
    try {
      final uri = Uri.tryParse(raw);
      if (uri != null && uri.queryParameters.isNotEmpty) {
        return QrScanResult(
          raw: raw,
          studentId:
              uri.queryParameters['student_id'] ?? uri.queryParameters['id'],
          studentName: uri.queryParameters['name'],
        );
      }
    } catch (_) {}
    // fallback — نعامل المحتوى كـ student_id مباشرة
    return QrScanResult(raw: raw, studentId: raw.trim());
  }
}

/// نوع حالة الحضور المختارة قبل بدء المسح — تطابق حالات الحضور المتاحة
/// للمسح السريع في الـ backend (AttendanceConfig)، باستثناء "اعتذار" التي
/// لا تُسجَّل عبر المسح.
enum ScanAttendanceKind { present, absent, late, earlyLeave }

extension on ScanAttendanceKind {
  String get statusId => switch (this) {
        ScanAttendanceKind.present => AttendanceConfig.presentStatusId,
        ScanAttendanceKind.absent => AttendanceConfig.absentStatusId,
        ScanAttendanceKind.late => AttendanceConfig.lateStatusId,
        ScanAttendanceKind.earlyLeave => AttendanceConfig.earlyLeaveStatusId,
      };

  String get label => switch (this) {
        ScanAttendanceKind.present => tr('حضور'),
        ScanAttendanceKind.absent => tr('غياب'),
        ScanAttendanceKind.late => tr('تأخر'),
        ScanAttendanceKind.earlyLeave => tr('مغادرة مبكرة'),
      };

  IconData get icon => switch (this) {
        ScanAttendanceKind.present => Icons.check_circle_rounded,
        ScanAttendanceKind.absent => Icons.cancel_rounded,
        ScanAttendanceKind.late => Icons.schedule_rounded,
        ScanAttendanceKind.earlyLeave => Icons.directions_walk_rounded,
      };

  Color get color => switch (this) {
        ScanAttendanceKind.present => AppColors.success,
        ScanAttendanceKind.absent => AppColors.error,
        ScanAttendanceKind.late => AppColors.gold,
        ScanAttendanceKind.earlyLeave => AppColors.primaryLight,
      };
}

// ─────────────────────────────────────────────────────────────────────────────
// شاشة مسح QR الرئيسية
// ─────────────────────────────────────────────────────────────────────────────
class QrScannerScreen extends StatefulWidget {
  /// الحساب الحالي — المسح يسجّل حضوراً، لذا يُشترط امتلاك صلاحية الحضور.
  final AuthToken token;
  final int? groupId; // اختياري — إذا عُرف مسبقاً يُستخدم كحلقة التسجيل
  final String? groupName;
  const QrScannerScreen({
    super.key,
    required this.token,
    this.groupId,
    this.groupName,
  });

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen>
    with SingleTickerProviderStateMixin {
  final MobileScannerController _scanner = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
  );
  final _service = AdminRepositoryImpl();

  bool _torchOn = false;
  bool _paused = false;
  bool _sending = false;
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
    debugPrint('QR raw scanned: $raw');
    HapticFeedback.mediumImpact();
    // الكاميرا تبقى تعمل بلا توقف — نمنع الاكتشافات المكرّرة بواسطة _sending فقط،
    // فيكون المسح التالي جاهزاً فور انتهاء الطلب دون أي تأخير إضافي.
    setState(() => _sending = true);

    final result = QrScanResult.fromRaw(raw);
    debugPrint(
      'QR parsed -> studentId: ${result.studentId}, studentName: ${result.studentName}',
    );
    await _submitAttendance(result);
  }

  Future<void> _submitAttendance(QrScanResult result) async {
    final displayName = result.studentName ?? result.studentId ?? result.raw;
    try {
      final scanValue = result.studentId?.trim();
      if (scanValue == null || scanValue.isEmpty) {
        throw Exception(tr('رمز QR غير صالح'));
      }

      final now = DateTime.now();

      debugPrint(
        'Quick-scanning attendance -> scanValue: $scanValue, '
        'statusId: ${_kind!.statusId}',
      );

      final scanResult = await _service.quickScanStudentAttendance(
        scanValue: scanValue,
        attendanceStatusId: _kind!.statusId,
      );

      if (!mounted) return;
      final record = _AttendanceRecord(
        studentName: scanResult.studentName.isNotEmpty
            ? scanResult.studentName
            : displayName,
        time: now,
        status: _RecordStatus.success,
      );
      setState(() {
        _sessionRecords.insert(0, record);
        _sending = false;
      });
      _showFeedback(success: true, name: record.studentName);
    } catch (e) {
      debugPrint('QR attendance submission failed: $e');
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
      _showFeedback(
          success: false, name: record.studentName, error: e.toString());
    }
  }

  void _showFeedback(
      {required bool success, required String name, String? error}) {
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
                    success ? tr('تم تسجيل الحضور') : tr('فشل التسجيل'),
                    style: appTextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    success ? name : (error ?? name),
                    style: appTextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 12,
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
  }

  void _selectKind(ScanAttendanceKind kind) {
    setState(() => _kind = kind);
  }

  @override
  Widget build(BuildContext context) {
    // بدون الصلاحية لا تُبنى الكاميرا أصلاً (MobileScanner) ولا تُطلب إذن الكاميرا.
    if (!ModuleAccess.canTakeStudentAttendance(widget.token)) {
      return Scaffold(
        backgroundColor: AppColors.bgDeep,
        body: Column(
          children: [
            _ScanTopBar(
              title: tr('مسح الحضور'),
              onClose: () => Navigator.pop(context),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outline_rounded,
                        size: 48,
                        color: AppColors.goldGlow,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        tr('ليس لديك صلاحية لتسجيل الحضور'),
                        textAlign: TextAlign.center,
                        style: appTextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (_kind == null) {
      return Scaffold(
        backgroundColor: AppColors.bgDeep,
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
          // يبقى الـ MobileScanner دائماً في الشجرة — التحكم بالإيقاف/الاستئناف
          // يتم فقط عبر controller.start()/stop() لتفادي تعارض "already running"
          // الناتج عن قيام الـ widget نفسه ببدء التحكم عند إعادة تركيبه.
          MobileScanner(
            controller: _scanner,
            onDetect: _onDetect,
          ),
          if (_paused && !_sending) Container(color: Colors.black87),

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
// الشريط العلوي المشترك: بنفس هوية شاشات الإدارة (تدرّج أخضر داكن).
// ─────────────────────────────────────────────────────────────────────────────
class _ScanTopBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback onClose;

  const _ScanTopBar({
    required this.title,
    required this.onClose,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.bgDeep, Color(0xFF0D5016)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
          child: Row(
            children: [
              _GlassIconButton(
                icon: Icons.close_rounded,
                tooltip: tr('إغلاق'),
                onTap: onClose,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: appTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: appTextStyle(
                          fontSize: 11,
                          color: AppColors.textOnDarkSub,
                        ),
                      ),
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 12),
                trailing!,
              ],
            ],
          ),
        ),
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
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppColors.gradientHero),
      child: Column(
        children: [
          _ScanTopBar(
            title: groupName ?? tr('مسح الحضور'),
            subtitle: tr('مسح رمز QR للطالب'),
            onClose: onClose,
          ),
          Expanded(
            child: SafeArea(
              top: false,
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 44,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          const Spacer(),
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppColors.gradientGold,
                              boxShadow:
                                  AppColors.coloredShadow(AppColors.gold),
                            ),
                            child: const Icon(
                              Icons.qr_code_scanner_rounded,
                              size: 48,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            tr('اختر نوع الحضور قبل بدء المسح'),
                            textAlign: TextAlign.center,
                            style: appTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 24),
                          for (final kind in ScanAttendanceKind.values) ...[
                            _KindButton(
                                kind: kind, onTap: () => onSelected(kind)),
                            const SizedBox(height: 12),
                          ],
                          const Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
    final color = kind.color;
    final chevron = Directionality.of(context) == TextDirection.rtl
        ? Icons.chevron_left_rounded
        : Icons.chevron_right_rounded;
    return Material(
      color: color.withValues(alpha: 0.14),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: color.withValues(alpha: 0.5), width: 1.2),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(kind.icon, color: color, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  kind.label,
                  style: appTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(chevron, color: color),
            ],
          ),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(child: _buildContent(context)),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        // ── Top bar ──────────────────────────────────────────────────────
        _ScanTopBar(
          title: groupName ?? tr('مسح الحضور'),
          onClose: onClose,
          trailing: _GlassIconButton(
            icon: torchOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
            tooltip: tr('الفلاش'),
            onTap: onToggleTorch,
            active: torchOn,
          ),
        ),

        // ── Attendance kind badge ────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Material(
            color: kind.color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(22),
            child: InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: sending ? null : onChangeKind,
              child: Container(
                constraints: const BoxConstraints(minHeight: 40),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: kind.color.withValues(alpha: 0.6)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(kind.icon, size: 16, color: kind.color),
                    const SizedBox(width: 6),
                    Text(
                      trf('تسجيل: {0}', [kind.label]),
                      style: appTextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: kind.color,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.edit_rounded,
                        size: 13, color: Colors.white.withValues(alpha: 0.7)),
                  ],
                ),
              ),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            sending
                ? tr('جارٍ تسجيل الحضور...')
                : paused
                    ? tr('المسح متوقف مؤقتاً')
                    : tr('وجّه الكاميرا نحو رمز QR الطالب'),
            textAlign: TextAlign.center,
            style: appTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: sending
                  ? AppColors.goldGlow
                  : paused
                      ? Colors.white70
                      : Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 24),

        // ── Pause / Resume button ─────────────────────────────────────────
        if (!sending)
          Material(
            color: paused ? AppColors.primaryMid : Colors.black54,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: onTogglePause,
              child: Container(
                constraints: const BoxConstraints(minHeight: 44),
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: paused ? AppColors.primaryGlow : Colors.white30,
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
                      paused ? tr('استئناف المسح') : tr('إيقاف مؤقت'),
                      style: appTextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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
    final screenSize = MediaQuery.of(context).size;
    final size = (screenSize.width * 0.68)
        .clamp(0.0, screenSize.height * 0.4)
        .toDouble();
    final color = widget.sending
        ? AppColors.gold
        : widget.paused
            ? Colors.white38
            : AppColors.primaryGlow;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Semi-transparent background
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: color.withValues(alpha: 0.5), width: 2),
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
                        color.withValues(alpha: 0.8),
                        color,
                        color.withValues(alpha: 0.8),
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
      Positioned(
          top: 0,
          right: 0,
          child: _Corner(
              len: len, w: w, r: r, color: color, top: true, right: true)),
      // Top-left
      Positioned(
          top: 0,
          left: 0,
          child: _Corner(
              len: len, w: w, r: r, color: color, top: true, right: false)),
      // Bottom-right
      Positioned(
          bottom: 0,
          right: 0,
          child: _Corner(
              len: len, w: w, r: r, color: color, top: false, right: true)),
      // Bottom-left
      Positioned(
          bottom: 0,
          left: 0,
          child: _Corner(
              len: len, w: w, r: r, color: color, top: false, right: false)),
    ];
  }
}

class _Corner extends StatelessWidget {
  final double len, w, r;
  final Color color;
  final bool top, right;
  const _Corner(
      {required this.len,
      required this.w,
      required this.r,
      required this.color,
      required this.top,
      required this.right});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: len,
      height: len,
      child: CustomPaint(
          painter:
              _CornerPainter(color: color, w: w, r: r, top: top, right: right)),
    );
  }
}

class _CornerPainter extends CustomPainter {
  final Color color;
  final double w, r;
  final bool top, right;
  const _CornerPainter(
      {required this.color,
      required this.w,
      required this.r,
      required this.top,
      required this.right});

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

class _SessionPanel extends StatefulWidget {
  final List<_AttendanceRecord> records;
  const _SessionPanel({required this.records});

  @override
  State<_SessionPanel> createState() => _SessionPanelState();
}

class _SessionPanelState extends State<_SessionPanel> {
  bool _collapsed = false;

  void _toggle() => setState(() => _collapsed = !_collapsed);

  void _onVerticalDrag(DragUpdateDetails details) {
    // سحب لأسفل = طيّ، سحب لأعلى = فرد
    if (details.delta.dy > 4 && !_collapsed) {
      setState(() => _collapsed = true);
    } else if (details.delta.dy < -4 && _collapsed) {
      setState(() => _collapsed = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      constraints: BoxConstraints(maxHeight: _collapsed ? 56 : 200),
      decoration: const BoxDecoration(
        color: Color(0xF2072714),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: Color(0xFF193222))),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _toggle,
        onVerticalDragUpdate: _onVerticalDrag,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGlow.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.history_rounded,
                        color: AppColors.primaryGlow, size: 17),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    tr('سجل الجلسة'),
                    style: appTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.gold.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${widget.records.length}',
                      style: appTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: AppColors.goldGlow,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    _collapsed
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: Colors.white54,
                    size: 20,
                  ),
                ],
              ),
            ),
            if (!_collapsed)
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                  itemCount: widget.records.length,
                  itemBuilder: (_, i) => _RecordTile(record: widget.records[i])
                      .animate()
                      .fadeIn(duration: 250.ms)
                      .slideY(begin: -0.1, end: 0, duration: 250.ms),
                ),
              ),
          ],
        ),
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
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              ok ? Icons.check_circle_rounded : Icons.cancel_rounded,
              color: color,
              size: 17,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.studentName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: appTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                if (!ok && record.error != null)
                  Text(
                    record.error!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appTextStyle(
                      fontSize: 11,
                      color: Colors.white70,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            timeStr,
            style: appTextStyle(fontSize: 11, color: Colors.white60),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// زر دائري زجاجي مساعد
// ─────────────────────────────────────────────────────────────────────────────
class _GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;
  final bool active;
  const _GlassIconButton({
    required this.icon,
    required this.onTap,
    required this.tooltip,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: active
            ? AppColors.gold.withValues(alpha: 0.25)
            : Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: active ? AppColors.gold : Colors.white24,
                width: 1.2,
              ),
            ),
            child: Icon(
              icon,
              color: active ? AppColors.goldGlow : Colors.white,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
