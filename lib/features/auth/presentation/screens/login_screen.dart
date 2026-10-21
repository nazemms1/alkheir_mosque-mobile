import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alkheir_mosque/features/home/presentation/screens/main_shell.dart';
import 'package:alkheir_mosque/app/core/config/server_config.dart';
import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/session/auth_session.dart';
import 'package:alkheir_mosque/app/core/session/theme_provider.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/auth/domain/repositories/auth_repository.dart';
import 'package:alkheir_mosque/features/auth/presentation/state_management/auth_state.dart';

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
  bool _loading = false;
  bool _remember = false;

  late final AnimationController _bgCtrl;
  late final AnimationController _fadeCtrl;
  late final AnimationController _slideCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  AuthRepository get _authService => ref.read(authRepositoryProvider);

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
    setState(() => _loading = true);

    try {
      final token = await _authService.login(
        login: _loginCtrl.text.trim(),
        password: _passCtrl.text,
        remember: _remember,
      );

      if (!mounted) return;

      // تخزين الجلسة مركزياً — أي شاشة تقرأ الدور/الصلاحيات من authSessionProvider
      ref.read(authSessionProvider.notifier).setToken(token);

      // التوجيه حسب الدور — MainShell يعرض الشاشات المناسبة لكل دور
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, a, __) => MainShell(token: token),
          transitionsBuilder: (_, a, __, child) =>
              FadeTransition(opacity: a, child: child),
          transitionDuration: const Duration(milliseconds: 600),
        ),
      );
    } on AuthException catch (e) {
      if (!mounted) return;
      _showError(e.message);
    } catch (e) {
      // خطأ غير متوقع: لا نعرض نص الاستثناء الخام للمستخدم.
      debugPrint('login failed: $e');
      if (!mounted) return;
      _showError(tr('حدث خطأ، حاول مرة أخرى'));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline_rounded,
                color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontFamily: 'Dubai',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  /// يفتح حواراً لتغيير عنوان الخادم (مثلاً عنوان جهاز الكمبيوتر على الشبكة).
  Future<void> _editServerUrl() async {
    final controller = TextEditingController(text: ServerConfig.baseUrl);
    final prefs = ref.read(sharedPrefsProvider);
    final value = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(tr('عنوان الخادم')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.url,
              textDirection: TextDirection.ltr,
              decoration:
                  InputDecoration(hintText: ServerConfig.defaultBaseUrl),
            ),
            const SizedBox(height: 8),
            Text(
              tr('مثال: http://10.0.2.2:8000'),
              style: appTextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, ServerConfig.defaultBaseUrl),
            child: Text(tr('استعادة الافتراضي')),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(tr('إلغاء')),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, controller.text),
            child: Text(tr('حفظ')),
          ),
        ],
      ),
    );
    // نؤجّل التخلص من المتحكم حتى ينتهي تحريك إغلاق الحوار.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    controller.dispose();
    if (value == null || !mounted) return;

    final saved = await ServerConfig.save(prefs, value);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          saved ? tr('تم حفظ عنوان الخادم') : tr('عنوان الخادم غير صالح'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.bgDeep,
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
                          loading: _loading,
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
              child: _TopActions(onServerTap: _editServerUrl),
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
            tooltip: tr('تغيير عنوان الخادم'),
            icon: const Icon(Icons.dns_rounded, color: Colors.white70),
            onPressed: onServerTap,
          ),
          IconButton(
            tooltip: tr('تبديل اللغة'),
            icon: const Icon(Icons.translate_rounded, color: Colors.white70),
            onPressed: () => ref.read(languageProvider.notifier).toggleLanguage(),
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.bgDeep,
                    Color(0xFF0A1F0D),
                    AppColors.bgDeep
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.05 + math.sin(t * math.pi) * 30,
              right: -size.width * 0.2,
              child: _GlowOrb(
                  size: size.width * 0.7,
                  color: AppColors.primaryLight,
                  opacity: 0.18 + t * 0.07),
            ),
            Positioned(
              bottom: size.height * 0.25 - math.cos(t * math.pi) * 20,
              left: -size.width * 0.15,
              child: _GlowOrb(
                  size: size.width * 0.55,
                  color: AppColors.primaryMid,
                  opacity: 0.12 + t * 0.05),
            ),
            Positioned(
              top: size.height * 0.38,
              left: size.width * 0.5,
              child: _GlowOrb(
                  size: size.width * 0.3,
                  color: AppColors.gold,
                  opacity: 0.06 + t * 0.04),
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
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.gold.withValues(alpha: 0.5),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryLight.withValues(alpha: 0.4),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/logo/لوغو.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, AppColors.primaryGlow],
            ).createShader(bounds),
            child: Text(
              tr('مسجد الخير'),
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
              border: Border.all(color: AppColors.glassBorder),
              color: AppColors.glassWhite,
            ),
            child: Text(
              tr('البوابة التعليمية'),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textOnDarkSub,
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
        color: isDark ? AppColors.bgDark : AppColors.bgWhiteCard,
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
                    color: AppColors.textMuted.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                tr('تسجيل الدخول'),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color:
                          isDark ? AppColors.textOnDark : AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                tr('أدخل بياناتك لمتابعة تقدم طفلك في الحلقة'),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 28),

              // Login field (email / username / phone)
              _PremiumField(
                controller: loginCtrl,
                label: tr('البريد / اسم المستخدم / الهاتف'),
                hint: tr('أدخل بريدك أو اسم المستخدم أو رقم الهاتف'),
                icon: Icons.person_rounded,
                isLtr: true,
                validator: null,
              ),
              const SizedBox(height: 14),

              // Password field
              _PremiumField(
                controller: passCtrl,
                label: tr('كلمة المرور'),
                hint: '••••••••',
                icon: Icons.lock_rounded,
                obscure: obscure,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscure
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                  onPressed: onToggleObscure,
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return tr('يرجى إدخال كلمة المرور');
                  }
                  if (v.length < 4) return tr('كلمة المرور قصيرة جداً');
                  return null;
                },
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Checkbox(
                    value: remember,
                    onChanged: onRememberChanged,
                    activeColor: AppColors.primaryLight,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  GestureDetector(
                    onTap: () => onRememberChanged(!remember),
                    child: Text(
                      tr('تذكّرني'),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryLight,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                    child: Text(
                      tr('نسيت كلمة المرور؟'),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _GradientButton(loading: loading, onTap: onLogin),

              const SizedBox(height: 20),
              _SupportHint(),
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
        fontSize: 15,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: AppColors.gradientPrimary,
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
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
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
              : AppColors.gradientPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: loading
              ? []
              : [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.4),
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
                      tr('تسجيل الدخول'),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 16,
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

class _SupportHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.glassGreen,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF25D366).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.chat_rounded,
                color: Color(0xFF25D366), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('هل تحتاج مساعدة؟'),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  tr('تواصل مع إدارة المسجد عبر واتساب للحصول على بيانات الدخول'),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
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
