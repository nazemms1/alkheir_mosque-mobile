import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/i18n/app_language.dart';
import '../../../core/session/auth_session.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/account_model.dart';
import '../../../data/services/account_service.dart';
import '../../auth/screens/login_screen.dart';
import '../../management/widgets/module_form_fields.dart';
import '../../management/widgets/module_widgets.dart';

/// "حسابي": البيانات الشخصية، اسم المستخدم (إن كان قابلاً للتعديل)،
/// الصورة، كلمة المرور، وتسجيل الخروج من هذا الجهاز أو من كل الأجهزة.
class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  final _service = AccountService();
  MobileUser? _user;
  bool _loading = true;
  bool _busy = false;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final user = await _service.me();
      if (!mounted) return;
      setState(() {
        _user = user;
        _loading = false;
        _error = null;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  void _reload() {
    setState(() {
      _loading = true;
      _error = null;
    });
    _load();
  }

  Future<void> _run(
    Future<void> Function() action, {
    required String success,
  }) async {
    setState(() => _busy = true);
    try {
      await action();
      if (!mounted) return;
      setState(() => _busy = false);
      showModuleSnack(context, success);
      _reload();
    } catch (error) {
      if (!mounted) return;
      setState(() => _busy = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  Future<void> _editUsername(MobileUser user) async {
    final ctrl = TextEditingController(text: user.username);
    final value = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(tr('تعديل اسم المستخدم'),
            style: appTextStyle(fontWeight: FontWeight.w700)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          style: appTextStyle(),
          decoration: InputDecoration(labelText: tr('اسم المستخدم')),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(tr('إلغاء'), style: appTextStyle()),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
            child: Text(tr('حفظ'), style: appTextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    ctrl.dispose();
    if (value == null || value.isEmpty || value == user.username) return;
    await _run(
      () => _service.updateUsername(value).then((_) {}),
      success: tr('تم تحديث اسم المستخدم'),
    );
  }

  Future<void> _changePhoto() async {
    final picked = await FilePicker.pickFiles(type: FileType.image);
    if (picked.isEmpty || !mounted) return;
    final file = picked.first;
    await _run(
      () async => _service
          .uploadProfilePhoto(
            fileName: file.name,
            bytes: await file.readAsBytes(),
          )
          .then((_) {}),
      success: tr('تم تحديث الصورة الشخصية'),
    );
  }

  Future<void> _changePassword() async {
    final saved = await showFormSheet(
      context,
      title: tr('تغيير كلمة المرور'),
      builder: (_) => const _PasswordForm(),
    );
    if (saved != true || !mounted) return;
    showModuleSnack(context, tr('تم تغيير كلمة المرور'));
  }

  Future<void> _logout({required bool everywhere}) async {
    final ok = await confirmAction(
      context,
      title: everywhere ? tr('الخروج من كل الأجهزة') : tr('تسجيل الخروج'),
      message: everywhere
          ? tr('سيتم إلغاء كل الجلسات المفتوحة لحسابك على كل الأجهزة.')
          : tr('هل تريد تسجيل الخروج من هذا الجهاز؟'),
      confirmLabel: everywhere ? tr('الخروج من الكل') : tr('تسجيل الخروج'),
      destructive: true,
    );
    if (!ok || !mounted) return;
    setState(() => _busy = true);
    try {
      if (everywhere) await _service.logoutEverywhere();
    } catch (_) {
      // نكمل الخروج المحلي حتى لو تعذّر الاتصال.
    }
    await ref.read(authSessionProvider.notifier).logout();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _user;
    return ModuleScaffold(
      title: tr('حسابي'),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null || user == null
              ? ModuleMessage(
                  text: errorText(_error ?? ''),
                  icon: Icons.error_outline_rounded,
                  color: AppColors.error,
                  onRetry: _reload,
                )
              : Stack(
                  children: [
                    ListView(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                      children: [
                        _Header(user: user),
                        const SizedBox(height: 10),
                        ModuleCard(
                          child: Column(
                            children: [
                              InfoRow(label: tr('الاسم'), value: user.name),
                              InfoRow(
                                  label: tr('اسم المستخدم'),
                                  value: user.username),
                              InfoRow(
                                  label: tr('البريد الإلكتروني'),
                                  value: user.email ?? ''),
                              InfoRow(
                                  label: tr('رقم الهاتف'),
                                  value: user.phone ?? ''),
                              InfoRow(
                                  label: tr('الدور'),
                                  value: user.primaryRole ?? ''),
                            ],
                          ),
                        ),
                        _ActionTile(
                          icon: Icons.badge_outlined,
                          label: tr('تعديل اسم المستخدم'),
                          subtitle: user.usernameIsEditable
                              ? tr('يمكن تغيير اسم المستخدم')
                              : tr('اسم المستخدم لا يمكن تغييره لهذا الحساب'),
                          enabled: user.usernameIsEditable && !_busy,
                          onTap: () => _editUsername(user),
                        ),
                        _ActionTile(
                          icon: Icons.photo_camera_outlined,
                          label: tr('تغيير الصورة الشخصية'),
                          subtitle: tr('صورة JPG أو PNG أو WebP'),
                          enabled: !_busy,
                          onTap: _changePhoto,
                        ),
                        _ActionTile(
                          icon: Icons.lock_reset_rounded,
                          label: tr('تغيير كلمة المرور'),
                          subtitle: tr(
                              'تبقى هذه الجلسة مفتوحة وتُلغى الأجهزة الأخرى'),
                          enabled: !_busy,
                          onTap: _changePassword,
                        ),
                        const SizedBox(height: 12),
                        _ActionTile(
                          icon: Icons.logout_rounded,
                          label: tr('تسجيل الخروج من هذا الجهاز'),
                          enabled: !_busy,
                          onTap: () => _logout(everywhere: false),
                        ),
                        _ActionTile(
                          icon: Icons.devices_other_rounded,
                          label: tr('الخروج من كل الأجهزة'),
                          subtitle: tr('يُلغي كل الجلسات المفتوحة لهذا الحساب'),
                          destructive: true,
                          enabled: !_busy,
                          onTap: () => _logout(everywhere: true),
                        ),
                      ],
                    ),
                    if (_busy)
                      const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: LinearProgressIndicator(minHeight: 2),
                      ),
                  ],
                ),
    );
  }
}

class _Header extends StatelessWidget {
  final MobileUser user;

  const _Header({required this.user});

  @override
  Widget build(BuildContext context) {
    final initial =
        user.name.trim().isEmpty ? '?' : user.name.trim().substring(0, 1);
    final photo = user.profilePhotoUrl;
    return ModuleCard(
      accent: AppColors.gold,
      child: Row(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: AppColors.gold.withValues(alpha: 0.2),
            backgroundImage: photo == null ? null : NetworkImage(photo),
            child: photo == null
                ? Text(
                    initial,
                    style: appTextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.gold,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: appTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '@${user.username}',
                  style:
                      appTextStyle(fontSize: 12, color: moduleMuted(context)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final bool enabled;
  final bool destructive;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.subtitle,
    this.enabled = true,
    this.destructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = destructive ? AppColors.error : AppColors.primaryLight;
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: ModuleCard(
        accent: color,
        onTap: enabled ? onTap : null,
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: appTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: destructive
                          ? AppColors.error
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: appTextStyle(
                          fontSize: 11, color: moduleMuted(context)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// نموذج كلمة المرور: الحالية، والجديدة (8 أحرف على الأقل)، والتأكيد.
class _PasswordForm extends StatefulWidget {
  const _PasswordForm();

  @override
  State<_PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<_PasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _current = TextEditingController();
  final _next = TextEditingController();
  final _confirm = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _current.dispose();
    _next.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_next.text.length < 8) {
      showModuleSnack(
        context,
        tr('كلمة المرور يجب أن تكون 8 أحرف على الأقل'),
        error: true,
      );
      return;
    }
    setState(() => _saving = true);
    try {
      await AccountService().changePassword(
        currentPassword: _current.text,
        password: _next.text,
      );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      showModuleSnack(context, errorText(error), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          moduleTextField(
            controller: _current,
            label: tr('كلمة المرور الحالية'),
            required: true,
            obscure: true,
          ),
          moduleTextField(
            controller: _next,
            label: tr('كلمة المرور الجديدة'),
            helper: tr('8 أحرف على الأقل'),
            required: true,
            obscure: true,
          ),
          TextFormField(
            controller: _confirm,
            obscureText: true,
            style: appTextStyle(),
            decoration:
                InputDecoration(labelText: tr('تأكيد كلمة المرور الجديدة')),
            validator: (value) =>
                value != _next.text ? tr('كلمتا المرور غير متطابقتين') : null,
          ),
          const SizedBox(height: 16),
          ModuleSaveButton(saving: _saving, onPressed: _save, label: tr('حفظ')),
        ],
      ),
    );
  }
}
