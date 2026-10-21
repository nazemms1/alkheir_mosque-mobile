import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/theme/app_theme.dart';
import 'package:alkheir_mosque/features/admin/presentation/widgets/admin_ui.dart';
import 'package:alkheir_mosque/ui/themes/dark.dart';
import 'package:alkheir_mosque/ui/themes/light.dart';

/// صفحة تجمع عناصر الإدارة المشتركة كما تظهر في الشاشات الفعلية.
Widget _adminPage() {
  return SingleChildScrollView(
    padding: kAdminPagePadding,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdminHero(
          icon: Icons.groups_rounded,
          title: tr('إدارة الحلقات'),
          subtitle: tr('الحلقات النشطة وعدد الطلاب المسجّلين'),
          trailing: const Icon(Icons.qr_code_scanner_rounded),
          metrics: [
            AdminHeroMetric(
              icon: Icons.check_circle_rounded,
              label: tr('حلقات نشطة'),
              value: '12',
            ),
            AdminHeroMetric(
              icon: Icons.people_rounded,
              label: tr('إجمالي الطلاب'),
              value: '1234',
            ),
          ],
        ),
        const SizedBox(height: 12),
        AdminStatGrid(
          tiles: [
            for (final label in [
              'إجمالي الطلاب',
              'حلقات نشطة',
              'التسجيلات',
              'الفواتير',
              'التقييمات',
              'الأنشطة',
            ])
              AdminStatTile(
                icon: Icons.people_rounded,
                label: tr(label),
                value: '123456',
                color: AppColors.info,
                onTap: () {},
              ),
          ],
        ),
        const SizedBox(height: 12),
        AdminCard(
          child: Row(
            children: [
              AdminAvatar(text: 'مح', color: AppColors.gold),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'محمد عبد الله بن إبراهيم الطويل جداً جداً جداً',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              AdminBadge(label: tr('نشط'), color: AppColors.success),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AdminChoiceBar<String>(
          options: const ['active', 'ended'],
          selected: 'active',
          labelOf: (o) => tr(o == 'active' ? 'نشط' : 'منتهي'),
          onSelected: (_) {},
        ),
        AdminEmptyState(
          icon: Icons.groups_outlined,
          title: tr('لا توجد حلقات'),
          subtitle: tr('ستظهر الحلقات النشطة هنا فور إنشائها'),
        ),
        AdminInfoRow(
          icon: Icons.person_rounded,
          label: tr('المعلم'),
          value: 'أحمد عبد الرحمن الخالدي',
        ),
      ],
    ),
  );
}

Widget _app(ThemeData theme, {required Widget body}) {
  return MaterialApp(
    theme: theme,
    debugShowCheckedModeBanner: false,
    locale: AppLanguage.current,
    supportedLocales: AppLanguage.supported,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: Scaffold(
      appBar: AdminAppBar(
        title: tr('الإدارة'),
        subtitle: tr('الوحدات الإدارية حسب صلاحياتك'),
      ),
      body: body,
    ),
  );
}

void main() {
  tearDown(() => AppLanguage.current = AppLanguage.arabic);

  for (final theme in [lightTheme, darkTheme]) {
    for (final lang in AppLanguage.supported) {
      for (final width in [320.0, 390.0]) {
        testWidgets(
          'admin UI has no overflow: ${theme.brightness.name} / '
          '${lang.languageCode} / ${width.toInt()}px',
          (tester) async {
            tester.view.physicalSize = Size(width, 800);
            tester.view.devicePixelRatio = 1.0;
            addTearDown(tester.view.resetPhysicalSize);
            addTearDown(tester.view.resetDevicePixelRatio);

            AppLanguage.current = lang;
            await tester.pumpWidget(_app(theme, body: _adminPage()));
            await tester.pump();

            expect(tester.takeException(), isNull);
            expect(find.text(tr('لا توجد حلقات')), findsOneWidget);
            expect(find.text(tr('إجمالي الطلاب')), findsWidgets);
          },
        );
      }
    }
  }

  for (final mode in [ThemeMode.light, ThemeMode.dark]) {
    testWidgets('admin text color follows the ${mode.name} theme', (
      tester,
    ) async {
      late Color text;
      await tester.pumpWidget(
        MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: mode,
          home: Builder(
            builder: (context) {
              text = AdminTheme.text(context);
              return const SizedBox();
            },
          ),
        ),
      );
      expect(
        text,
        mode == ThemeMode.dark ? AppColors.textOnDark : AppColors.textPrimary,
      );
    });
  }
}
