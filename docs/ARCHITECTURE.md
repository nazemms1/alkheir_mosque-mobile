# دليل بنية التطبيق — البوابة التعليمية (مسجد الخير)

هذا الدليل يشرح بنية الكود وكيفية إضافة صفحات وأدوار وويدجتس جديدة **دون تعديل أي منطق تنقل أو حراسة صلاحيات**.

## نظرة عامة على المجلدات

```
lib/
├── core/                        # البنية التحتية المشتركة (لا تعتمد على ميزات محددة)
│   ├── rbac/                    # نظام الأدوار والصلاحيات المركزي
│   │   ├── app_role.dart        # enum الأدوار + ترجمة أسماء أدوار الـ API
│   │   ├── permissions.dart     # ثوابت أسماء الصلاحيات (مطابقة للـ backend)
│   │   └── permission_guard.dart# PermissionGuard / RoleGuard لإخفاء عناصر الواجهة
│   ├── session/                 # الجلسة والحالة العامة (Riverpod)
│   │   ├── auth_session.dart    # authSessionProvider — جلسة المستخدم الحالية
│   │   ├── service_providers.dart # مزوّدات الخدمات (Auth/Api/Admin/Student)
│   │   └── theme_provider.dart  # وضع المظهر فاتح/داكن + sharedPrefsProvider
│   ├── navigation/              # التنقل
│   │   ├── app_tab.dart         # تعريف AppTab و TabContext
│   │   └── tab_registry.dart    # ⭐ سجل كل تبويبات التطبيق وشروط ظهورها
│   ├── theme/                   # الألوان والثيمات المركزية
│   └── widgets/                 # ويدجتس أساسية (Toast...)
├── data/
│   ├── models/                  # نماذج البيانات (AuthToken, StudentModel...)
│   └── services/                # خدمات الـ API
├── features/                    # كل ميزة في مجلدها (screens + widgets)
│   ├── home/
│   │   ├── home_widget_registry.dart  # ⭐ نمط ويدجتس الرئيسية القابلة للتركيب
│   │   └── screens/             # MainShell + HomeScreen + parentHomeWidgets
│   ├── admin/                   # شاشات الإداري + adminHomeWidgets
│   ├── supervisor/              # شاشات الأدوار الإشرافية + supervisorHomeWidgets
│   └── ...                      # attendance / memorization / points / notes ...
└── shared/widgets/              # ويدجتس مشتركة بين الميزات
```

## نظام الأدوار والصلاحيات (RBAC)

- **الأدوار** تأتي من الـ API كنصوص (عربية/إنجليزية) وتُترجم **في مكان واحد فقط**:
  `AppRole.fromApiStrings()` في `core/rbac/app_role.dart`.
- **الصلاحيات** نصوص من الـ backend (مثل `students.view`) وأسماؤها ثوابت في
  `core/rbac/permissions.dart`. الفحص: `token.hasPermission(Permissions.studentsView)`.
- **الجلسة الحالية** متاحة في أي مكان عبر Riverpod:
  ```dart
  final token = ref.watch(authSessionProvider);   // AuthToken? (null = غير مسجّل)
  ```

### إخفاء زر أو قسم داخل شاشة حسب الصلاحية

```dart
import 'package:alkheir_mosque/core/rbac/permission_guard.dart';

PermissionGuard(
  anyOf: const [Permissions.paymentsCreate],   // تكفي واحدة من هذه
  child: ElevatedButton(onPressed: _pay, child: const Text('تسجيل دفعة')),
)

RoleGuard(
  roles: const {AppRole.admin, AppRole.supervisor},
  child: const _ReportsSection(),
)
```

## كيف أضيف صفحة (تبويب) جديدة؟

ثلاث خطوات فقط — لا تلمس MainShell ولا أي منطق تنقل:

1. **أنشئ الشاشة** في `lib/features/<الميزة>/screens/my_screen.dart`.
2. **أضف تبويباً** في `core/navigation/tab_registry.dart` داخل قائمة العائلة المناسبة
   (`parentTabs` / `adminTabs` / `supervisorTabs`):
   ```dart
   AppTab(
     id: 'admin-reports',
     icon: Icons.bar_chart_outlined,
     activeIcon: Icons.bar_chart_rounded,
     label: 'التقارير',                       // اسم التبويب في الشريط السفلي
     title: 'تقارير المسجد',                  // عنوان الشريط العلوي (اختياري)
     subtitle: 'إحصائيات وتقارير',
     anyOfPermissions: const [Permissions.reportsView],  // شرط الظهور
     builder: (ctx) => MyReportsScreen(token: ctx.token),
   ),
   ```
3. **حدّد شرط الظهور**: `anyOfPermissions` (تكفي صلاحية واحدة) و/أو `visibleWhen`
   لشروط مركّبة: `visibleWhen: (t) => t.isSupervisor || t.isAdmin`.

> ملاحظة: موضع الـ AppTab في القائمة يحدد ترتيبه في شريط التنقل.

## كيف أضيف دوراً جديداً؟

1. أضف القيمة إلى `enum AppRole` مع اسمها المعروض بالعربية.
2. أضف أسماء الدور القادمة من الـ API إلى `AppRole._apiAliases`.
3. أضفه إلى `AppRole.staffRoles` إن كان دوراً إشرافياً.
4. اربطه بالتبويبات: إمّا ضمن عائلة موجودة (أضف الدور في شروط `visibleWhen`)
   أو أنشئ عائلة تبويبات جديدة في `tab_registry.dart` وأضفها في `tabsFor()`.

## كيف أضيف ويدجت جديداً للشاشة الرئيسية؟

كل دور له قائمة ويدجتس مرتّبة (نمط Widget Registry — بدون if/else):

| الدور | القائمة | الملف |
|---|---|---|
| ولي الأمر/الطالب | `parentHomeWidgets` | `features/home/screens/home_screen.dart` |
| الإداري | `adminHomeWidgets` | `features/admin/screens/admin_dashboard_screen.dart` |
| الإشرافي | `supervisorHomeWidgets` | `features/supervisor/screens/supervisor_shell.dart` |

أضف `HomeWidgetDef` واحداً في الموضع الذي تريده:

```dart
HomeWidgetDef(
  id: 'admin-weekly-attendance',
  anyOfPermissions: const [Permissions.reportsView],   // اختياري
  visibleWhen: (token, data) => data.stats.total > 0,  // اختياري
  slivers: (context, data) => [
    SliverToBoxAdapter(child: WeeklyAttendanceCard(stats: data.stats)),
  ],
),
```

الشاشة تعرض الويدجتس تلقائياً بالترتيب بعد ترشيحها بالصلاحيات — لا تعديل في أي مكان آخر.

## قواعد عامة

- لا تنشئ خدمة داخل الشاشات (`AuthService()`)؛ اقرأها من `service_providers.dart`:
  `ref.read(adminServiceProvider)`.
- لا تقارن أسماء أدوار نصياً خارج `app_role.dart` مطلقاً.
- الألوان والخطوط من `core/theme/app_theme.dart` — لا قيم لونية مكتوبة يدوياً في الشاشات الجديدة.
- ملفات المشروع UTF-8 بدون BOM — انتبه عند استخدام أدوات خارجية لتعديلها.
