import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/ui/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:alkheir_mosque/ui/widgets/geometric_pattern.dart';
import 'package:alkheir_mosque/app/core/utils/reduced_motion.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/config/support_contact.dart';
import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/ui/widgets/app_feedback.dart';
import 'package:alkheir_mosque/ui/widgets/brand_logo.dart';
import 'package:alkheir_mosque/features/shared/auth/ui/providers/login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _loginCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _remember = false;

  late final AnimationController _bgCtrl;
  late final AnimationController _fadeCtrl;
  late final AnimationController _slideCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bgCtrl.respectReducedMotion(context);
  }

  @override
  void initState() {
    super.initState();
    _bgCtrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 8))
          ..repeat(reverse: true);
    _fadeCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _slideCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _slideCtrl, curve: Curves.easeOutCubic));

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        _fadeCtrl.forward();
        _slideCtrl.forward();
      }
    });
  }

  @override
  void dispose() {
    _bgCtrl.dispose();
    _fadeCtrl.dispose();
    _slideCtrl.dispose();
    _loginCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    final controller = ref.read(loginControllerProvider.notifier);
    final token = await controller.login(
      login: _loginCtrl.text.trim(),
      password: _passCtrl.text,
      remember: _remember,
    );
    if (!mounted) return;
    if (token == null) {
      _showError(ref.read(loginControllerProvider).errorMessage ??
          L10nGateway.current.somethingWentWrongPleaseTry);
      return;
    }

    // التوجيه حسب الدور — MainShell يعرض الشاشات المناسبة لكل دور
    context.go(AppRoutes.mainShellRoute, extra: token);
  }

  void _showError(String message) =>
      showAppSnack(context, message, error: true);

  /// عنوان الخادم ثابت على خادم المسجد الرسمي ولا يُغيَّر من داخل التطبيق.
  /// (كان الحوار يعرض "تم الحفظ" دون أي تغيير فعلي، فاستُبدل بإشعار صريح.)
  void _showServerInfo() {
    showAppSnack(context, L10nGateway.current.serverAddressFixed);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: context.appColors.bgDeep,
      body: Stack(
        children: [
          _AnimatedBackground(controller: _bgCtrl, size: size),
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: Column(
                  children: [
                    Expanded(flex: 5, child: _HeroSection()),
                    Expanded(
                        flex: 7,
                        child: _FormPanel(
                          formKey: _formKey,
                          loginCtrl: _loginCtrl,
                          passCtrl: _passCtrl,
                          obscure: _obscure,
                          loading: ref.watch(loginControllerProvider).isLoading,
                          remember: _remember,
                          onToggleObscure: () =>
                              setState(() => _obscure = !_obscure),
                          onRememberChanged: (v) =>
                              setState(() => _remember = v ?? false),
                          onLogin: _login,
                        )),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: _TopActions(onServerTap: _showServerInfo),
            ),
          ),
        ],
      ),
    );
  }
}

/// أزرار أعلى الشاشة: تغيير عنوان الخادم وتبديل اللغة.
class _TopActions extends ConsumerWidget {
  final VoidCallback onServerTap;
  const _TopActions({required this.onServerTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: context.l10n.changeServerAddress,
            icon: const Icon(Icons.dns_rounded, color: Colors.white70),
            onPressed: onServerTap,
          ),
          IconButton(
            tooltip: context.l10n.switchLanguage,
            icon: const Icon(Icons.translate_rounded, color: Colors.white70),
            onPressed: () =>
                ref.read(languageProvider.notifier).toggleLanguage(),
          ),
        ],
      ),
    );
  }
}

// ─── Animated Background ──────────────────────────────────────────────────────
class _AnimatedBackground extends StatelessWidget {
  final AnimationController controller;
  final Size size;
  const _AnimatedBackground({required this.controller, required this.size});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final t = controller.value;
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.appColors.bgDeep,
                    Color(0xFF0A1F0D),
                    context.appColors.bgDeep
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            const Positioned.fill(child: GeometricPattern(opacity: 0.04)),
            Positioned(
              top: size.height * 0.05 + math.sin(t * math.pi) * 30,
              right: -size.width * 0.2,
              child: _GlowOrb(
                  size: size.width * 0.7,
                  color: context.appColors.primaryLight,
                  opacity: 0.18 + t * 0.07),
            ),
          ],
        );
      },
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;
  const _GlowOrb(
      {required this.size, required this.color, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withValues(alpha: opacity), Colors.transparent],
        ),
      ),
    );
  }
}

// ─── Hero Section ─────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BrandLogo(size: 104),
          const SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, context.appColors.primaryGlow],
            ).createShader(bounds),
            child: Text(
              context.l10n.alKhairMosque,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: context.appColors.glassBorder),
              color: context.appColors.glassWhite,
            ),
            child: Text(
              context.l10n.educationalPortal,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: context.appColors.textOnDarkSub,
                    letterSpacing: 0.5,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Form Panel ───────────────────────────────────────────────────────────────
class _FormPanel extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController loginCtrl, passCtrl;
  final bool obscure, loading, remember;
  final VoidCallback onToggleObscure;
  final ValueChanged<bool?> onRememberChanged;
  final VoidCallback onLogin;

  const _FormPanel({
    required this.formKey,
    required this.loginCtrl,
    required this.passCtrl,
    required this.obscure,
    required this.loading,
    required this.remember,
    required this.onToggleObscure,
    required this.onRememberChanged,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color:
            isDark ? context.appColors.bgDark : context.appColors.bgWhiteCard,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top pill handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: context.appColors.textMuted.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                context.l10n.signIn,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: isDark
                          ? context.appColors.textOnDark
                          : context.appColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                context.l10n.enterYourDetailsToFollow,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.appColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 28),

              // Login field (email / username / phone)
              _PremiumField(
                controller: loginCtrl,
                label: context.l10n.emailUsernamePhone,
                hint: context.l10n.enterYourEmailUsernameOr,
                icon: Icons.person_rounded,
                isLtr: true,
                validator: null,
              ),
              const SizedBox(height: 14),

              // Password field
              _PremiumField(
                controller: passCtrl,
                label: context.l10n.password,
                hint: '••••••••',
                icon: Icons.lock_rounded,
                obscure: obscure,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscure
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    color: context.appColors.textSecondary,
                    size: 20,
                  ),
                  onPressed: onToggleObscure,
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return L10nGateway.current.pleaseEnterYourPassword;
                  }
                  if (v.length < 4) {
                    return L10nGateway.current.passwordIsTooShort;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Checkbox(
                    value: remember,
                    onChanged: onRememberChanged,
                    activeColor: context.appColors.primaryLight,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  GestureDetector(
                    onTap: () => onRememberChanged(!remember),
                    child: Text(
                      context.l10n.rememberMe,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: context.appColors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => _showForgotPasswordDialog(context),
                    style: TextButton.styleFrom(
                      foregroundColor: context.appColors.primaryLight,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                    child: Text(
                      context.l10n.forgotPassword,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: context.appColors.primaryLight,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _GradientButton(loading: loading, onTap: onLogin),

              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => openSupportWhatsApp(context),
                child: const _SupportHint(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PremiumField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;
  final IconData icon;
  final bool obscure, isLtr;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const _PremiumField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.isLtr = false,
    this.suffixIcon,
    this.validator,
  }) : keyboardType = null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      textDirection: isLtr ? TextDirection.ltr : null,
      validator: validator,
      style: TextStyle(
        fontFamily: 'Dubai',
        fontWeight: FontWeight.w600,
        fontSize: FontSize.bodyLarge,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: context.appColors.gradientPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide:
              BorderSide(color: context.appColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: context.appColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: context.appColors.error, width: 2),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  final bool loading;
  final VoidCallback onTap;
  const _GradientButton({required this.loading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 56,
        decoration: BoxDecoration(
          gradient: loading
              ? const LinearGradient(
                  colors: [Color(0xFF7AAD82), Color(0xFF7AAD82)])
              : context.appColors.gradientPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: loading
              ? []
              : [
                  BoxShadow(
                    color:
                        context.appColors.brandPrimary.withValues(alpha: 0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
        ),
        child: Center(
          child: loading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2.5),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.login_rounded,
                        color: Colors.white, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      context.l10n.signIn,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: FontSize.title,
                            letterSpacing: 0.5,
                          ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// حوار "نسيت كلمة المرور": لا توجد خدمة استعادة ذاتية، فيُوجَّه المستخدم لإدارة المسجد.
void _showForgotPasswordDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        L10nGateway.current.forgotPassword,
        style: appTextStyle(fontWeight: FontWeight.w700),
      ),
      content: Text(
        L10nGateway.current.resetPasswordViaWhatsapp,
        style: appTextStyle(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text(L10nGateway.current.cancel, style: appTextStyle()),
        ),
        FilledButton.icon(
          onPressed: () {
            Navigator.pop(ctx);
            openSupportWhatsApp(
              context,
              message: L10nGateway.current.forgotPasswordWhatsappMessage,
            );
          },
          icon: const Icon(Icons.chat_rounded, size: 18),
          label: Text(L10nGateway.current.contactViaWhatsapp,
              style: appTextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}

class _SupportHint extends StatelessWidget {
  const _SupportHint();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.appColors.glassGreen,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            color: context.appColors.primaryLight.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.appColors.whatsapp.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.chat_rounded,
                color: context.appColors.whatsapp, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.needHelp,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: context.appColors.brandPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  context.l10n.contactTheMosqueAdministrationVia,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: context.appColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
