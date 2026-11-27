import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/app/core/session/auth_session.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/account/domain/entities/account_entity.dart';
import 'package:alkheir_mosque/features/shared/account/ui/providers/account_controller.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_form_fields.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/module_widgets.dart';

/// "حسابي": البيانات الشخصية، اسم المستخدم (إن كان قابلاً للتعديل)،
/// الصورة، كلمة المرور، وتسجيل الخروج من هذا الجهاز أو من كل الأجهزة.
class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  AccountController get _controller =>
      ref.read(accountControllerProvider.notifier);

  Future<void> _run(
    Future<String?> Function() action, {
    required String success,
  }) async {
    final error = await action();
    if (!mounted) return;
    showModuleSnack(context, error ?? success, error: error != null);
  }

  Future<void> _editUsername(MobileUserEntity user) async {
    final ctrl = TextEditingController(text: user.username);
    final value = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(L10nGateway.current.editUsername,
            style: appTextStyle(fontWeight: FontWeight.w700)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          style: appTextStyle(),
          decoration: InputDecoration(labelText: L10nGateway.current.username),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(L10nGateway.current.cancel, style: appTextStyle()),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, ctrl.text.trim()),
            child: Text(L10nGateway.current.save,
                style: appTextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    ctrl.dispose();
    if (value == null || value.isEmpty || value == user.username) return;
    await _run(
      () => _controller.updateUsername(value),
      success: L10nGateway.current.usernameUpdated,
    );
  }

  Future<void> _changePhoto() async {
    final picked =
        await FilePicker.pickFiles(type: FileType.image, withData: true);
    if (picked == null || picked.files.isEmpty || !mounted) return;
    final file = picked.files.first;
    final bytes = file.bytes ??
        (file.path != null
            ? await File(file.path!).readAsBytes()
            : Uint8List(0));
    await _run(
      () => _controller.uploadProfilePhoto(file.name, bytes),
      success: L10nGateway.current.profilePhotoUpdated,
    );
  }

  Future<void> _changePassword() async {
    final saved = await showFormSheet(
      context,
      title: L10nGateway.current.changePassword,
      builder: (_) => const _PasswordForm(),
    );
    if (saved != true || !mounted) return;
    showModuleSnack(context, L10nGateway.current.passwordChanged);
  }

  Future<void> _logout({required bool everywhere}) async {
    final ok = await confirmAction(
      context,
      title: everywhere
          ? L10nGateway.current.signOutOfAllDevices
          : L10nGateway.current.signOut,
      message: everywhere
          ? L10nGateway.current.allOpenSessionsForYour
          : L10nGateway.current.doYouWantToSign,
      confirmLabel: everywhere
          ? L10nGateway.current.signOutEverywhere
          : L10nGateway.current.signOut,
      destructive: true,
    );
    if (!ok || !mounted) return;
    if (everywhere) await _controller.logoutEverywhere();
    await ref.read(authSessionProvider.notifier).logout();
    if (!mounted) return;
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(accountControllerProvider);
    final user = state.user;
    final busy = state.isBusy;
    return ModuleScaffold(
      title: context.l10n.myAccount,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.errorMessage != null || user == null
              ? ModuleMessage(
                  text: errorText(state.errorMessage ?? ''),
                  icon: Icons.error_outline_rounded,
                  color: context.appColors.error,
                  onRetry: _controller.load,
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
                              InfoRow(
                                  label: context.l10n.name, value: user.name),
                              InfoRow(
                                  label: context.l10n.username,
                                  value: user.username),
                              InfoRow(
                                  label: context.l10n.email,
                                  value: user.email ?? ''),
                              InfoRow(
                                  label: context.l10n.phoneNumber,
                                  value: user.phone ?? ''),
                              InfoRow(
                                  label: context.l10n.role,
                                  value: user.primaryRole ?? ''),
                            ],
                          ),
                        ),
                        _ActionTile(
                          icon: Icons.badge_outlined,
                          label: context.l10n.editUsername,
                          subtitle: user.usernameIsEditable
                              ? context.l10n.theUsernameCanBeChanged
                              : context.l10n.theUsernameCannotBeChanged,
                          enabled: user.usernameIsEditable && !busy,
                          onTap: () => _editUsername(user),
                        ),
                        _ActionTile(
                          icon: Icons.photo_camera_outlined,
                          label: context.l10n.changeProfilePhoto,
                          subtitle: context.l10n.jpgPngOrWebpImage,
                          enabled: !busy,
                          onTap: _changePhoto,
                        ),
                        _ActionTile(
                          icon: Icons.lock_reset_rounded,
                          label: context.l10n.changePassword,
                          subtitle: context.l10n.thisSessionStaysOpenAnd,
                          enabled: !busy,
                          onTap: _changePassword,
                        ),
                        const SizedBox(height: 12),
                        _ActionTile(
                          icon: Icons.logout_rounded,
                          label: context.l10n.signOutOfThisDevice,
                          enabled: !busy,
                          onTap: () => _logout(everywhere: false),
                        ),
                        _ActionTile(
                          icon: Icons.devices_other_rounded,
                          label: context.l10n.signOutOfAllDevices,
                          subtitle: context.l10n.cancelsAllOpenSessionsFor,
                          destructive: true,
                          enabled: !busy,
                          onTap: () => _logout(everywhere: true),
                        ),
                      ],
                    ),
                    if (busy)
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
  final MobileUserEntity user;

  const _Header({required this.user});

  @override
  Widget build(BuildContext context) {
    final initial =
        user.name.trim().isEmpty ? '?' : user.name.trim().substring(0, 1);
    final photo = user.profilePhotoUrl;
    return ModuleCard(
      accent: context.appColors.gold,
      child: Row(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: context.appColors.gold.withValues(alpha: 0.2),
            backgroundImage: photo == null ? null : NetworkImage(photo),
            child: photo == null
                ? Text(
                    initial,
                    style: appTextStyle(
                      fontSize: FontSize.headlineLarge,
                      fontWeight: FontWeight.w800,
                      color: context.appColors.goldText,
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
                    fontSize: FontSize.title,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '@${user.username}',
                  style: appTextStyle(
                      fontSize: FontSize.caption, color: moduleMuted(context)),
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
    final color =
        destructive ? context.appColors.error : context.appColors.primaryLight;
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
                      fontSize: FontSize.body,
                      fontWeight: FontWeight.w700,
                      color: destructive
                          ? context.appColors.error
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: appTextStyle(
                          fontSize: FontSize.caption,
                          color: moduleMuted(context)),
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
class _PasswordForm extends ConsumerStatefulWidget {
  const _PasswordForm();

  @override
  ConsumerState<_PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends ConsumerState<_PasswordForm> {
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
        L10nGateway.current.passwordMustBeAtLeast,
        error: true,
      );
      return;
    }
    setState(() => _saving = true);
    final error =
        await ref.read(accountControllerProvider.notifier).changePassword(
              currentPassword: _current.text,
              password: _next.text,
            );
    if (!mounted) return;
    if (error == null) {
      Navigator.pop(context, true);
      return;
    }
    setState(() => _saving = false);
    showModuleSnack(context, error, error: true);
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
            label: context.l10n.currentPassword,
            required: true,
            obscure: true,
          ),
          moduleTextField(
            controller: _next,
            label: context.l10n.newPassword,
            helper: context.l10n.charactersMinimum,
            required: true,
            obscure: true,
          ),
          TextFormField(
            controller: _confirm,
            obscureText: true,
            style: appTextStyle(),
            decoration:
                InputDecoration(labelText: context.l10n.confirmNewPassword),
            validator: (value) => value != _next.text
                ? L10nGateway.current.passwordsDoNotMatch
                : null,
          ),
          const SizedBox(height: 16),
          ModuleSaveButton(
              saving: _saving, onPressed: _save, label: context.l10n.save),
        ],
      ),
    );
  }
}
