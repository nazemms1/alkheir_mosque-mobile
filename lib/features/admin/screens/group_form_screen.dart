import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/admin_dashboard_model.dart';
import '../../../data/services/admin_service.dart';
import '../../../data/services/api_service.dart';

/// نموذج إنشاء/تعديل حلقة.
/// ملاحظة: الـ API لا يوفّر مسارات لجلب قوائم المقررات/المعلمين/السنوات
/// الدراسية/الصفوف، لذا تُدخَل معرّفاتها (IDs) يدويًا كأرقام.
class GroupFormScreen extends StatefulWidget {
  final AdminGroupDetail? group;

  const GroupFormScreen({super.key, this.group});

  @override
  State<GroupFormScreen> createState() => _GroupFormScreenState();
}

class _GroupFormScreenState extends State<GroupFormScreen> {
  final _service = AdminService();
  final _formKey = GlobalKey<FormState>();

  late final _nameCtrl = TextEditingController(text: widget.group?.name ?? '');
  final _academicYearIdCtrl = TextEditingController();
  final _courseIdCtrl = TextEditingController();
  final _teacherIdCtrl = TextEditingController();
  final _assistantTeacherIdCtrl = TextEditingController();
  final _gradeLevelIdCtrl = TextEditingController();
  final _capacityCtrl = TextEditingController();
  final _monthlyFeeCtrl = TextEditingController();
  late final _startsOnCtrl = TextEditingController(text: widget.group?.startsOn ?? '');
  late final _endsOnCtrl = TextEditingController(text: widget.group?.endsOn ?? '');

  late bool _isActive = widget.group?.isActive ?? true;
  bool _saving = false;
  String? _error;

  bool get _isEdit => widget.group != null;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _academicYearIdCtrl.dispose();
    _courseIdCtrl.dispose();
    _teacherIdCtrl.dispose();
    _assistantTeacherIdCtrl.dispose();
    _gradeLevelIdCtrl.dispose();
    _capacityCtrl.dispose();
    _monthlyFeeCtrl.dispose();
    _startsOnCtrl.dispose();
    _endsOnCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _saving = true; _error = null; });
    try {
      final assistantTeacherId = _assistantTeacherIdCtrl.text.trim().isEmpty
          ? null
          : int.parse(_assistantTeacherIdCtrl.text.trim());
      if (_isEdit) {
        await _service.updateGroup(
          widget.group!.id,
          name: _nameCtrl.text.trim(),
          academicYearId: int.parse(_academicYearIdCtrl.text.trim()),
          courseId: int.parse(_courseIdCtrl.text.trim()),
          teacherId: int.parse(_teacherIdCtrl.text.trim()),
          assistantTeacherId: assistantTeacherId,
          gradeLevelId: int.parse(_gradeLevelIdCtrl.text.trim()),
          capacity: int.parse(_capacityCtrl.text.trim()),
          monthlyFee: int.parse(_monthlyFeeCtrl.text.trim()),
          startsOn: _startsOnCtrl.text.trim(),
          endsOn: _endsOnCtrl.text.trim(),
          isActive: _isActive,
        );
      } else {
        await _service.createGroup(
          name: _nameCtrl.text.trim(),
          academicYearId: int.parse(_academicYearIdCtrl.text.trim()),
          courseId: int.parse(_courseIdCtrl.text.trim()),
          teacherId: int.parse(_teacherIdCtrl.text.trim()),
          assistantTeacherId: assistantTeacherId,
          gradeLevelId: int.parse(_gradeLevelIdCtrl.text.trim()),
          capacity: int.parse(_capacityCtrl.text.trim()),
          monthlyFee: int.parse(_monthlyFeeCtrl.text.trim()),
          startsOn: _startsOnCtrl.text.trim(),
          endsOn: _endsOnCtrl.text.trim(),
          isActive: _isActive,
        );
      }
      if (!mounted) return;
      Navigator.pop(context, true);
    } on ApiException catch (e) {
      setState(() { _error = e.message; _saving = false; });
    } catch (e) {
      setState(() { _error = e.toString(); _saving = false; });
    }
  }

  Future<void> _pickDate(TextEditingController ctrl) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      ctrl.text =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'تعديل الحلقة' : 'إضافة حلقة',
            style: const TextStyle(fontFamily: 'Cairo')),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            if (_error != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: AppColors.error.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.error.withOpacity(0.3)),
                ),
                child: Text(_error!,
                    style: const TextStyle(fontFamily: 'Cairo', color: AppColors.error, fontSize: 13)),
              ),
            ],
            _field(_nameCtrl, 'اسم الحلقة', required: true),
            _field(_academicYearIdCtrl, 'رقم السنة الدراسية (academic_year_id)',
                required: true, keyboardType: TextInputType.number),
            _field(_courseIdCtrl, 'رقم المقرر (course_id)',
                required: true, keyboardType: TextInputType.number),
            _field(_teacherIdCtrl, 'رقم المعلم (teacher_id)',
                required: true, keyboardType: TextInputType.number),
            _field(_assistantTeacherIdCtrl, 'رقم المساعد (اختياري)',
                keyboardType: TextInputType.number),
            _field(_gradeLevelIdCtrl, 'رقم الصف (grade_level_id)',
                required: true, keyboardType: TextInputType.number),
            _field(_capacityCtrl, 'السعة القصوى', required: true, keyboardType: TextInputType.number),
            _field(_monthlyFeeCtrl, 'الرسوم الشهرية', required: true, keyboardType: TextInputType.number),
            _dateField(_startsOnCtrl, 'تاريخ البدء'),
            _dateField(_endsOnCtrl, 'تاريخ الانتهاء'),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: _isActive,
              onChanged: (v) => setState(() => _isActive = v),
              activeColor: AppColors.primaryLight,
              title: const Text('حلقة نشطة',
                  style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w700)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _saving ? null : _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryLight,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: _saving
                    ? const SizedBox(
                        width: 22, height: 22,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                      )
                    : Text(_isEdit ? 'حفظ التعديلات' : 'إنشاء الحلقة',
                        style: const TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController ctrl,
    String label, {
    bool required = false,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: ctrl,
        keyboardType: keyboardType,
        style: const TextStyle(fontFamily: 'Cairo'),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontFamily: 'Cairo'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (v) {
          if (required && (v == null || v.trim().isEmpty)) return 'هذا الحقل مطلوب';
          if (keyboardType == TextInputType.number &&
              v != null && v.trim().isNotEmpty &&
              int.tryParse(v.trim()) == null) {
            return 'يجب أن يكون رقمًا';
          }
          return null;
        },
      ),
    );
  }

  Widget _dateField(TextEditingController ctrl, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: ctrl,
        readOnly: true,
        onTap: () => _pickDate(ctrl),
        style: const TextStyle(fontFamily: 'Cairo'),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontFamily: 'Cairo'),
          suffixIcon: const Icon(Icons.calendar_today_rounded, size: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (v) => (v == null || v.trim().isEmpty) ? 'هذا الحقل مطلوب' : null,
      ),
    );
  }
}
