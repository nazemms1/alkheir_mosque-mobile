import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/i18n/app_language.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/management/presentation/widgets/module_widgets.dart';

Widget _app(Widget body) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    locale: AppLanguage.current,
    supportedLocales: AppLanguage.supported,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: Scaffold(body: body),
  );
}

void main() {
  tearDown(() => AppLanguage.current = AppLanguage.arabic);

  for (final lang in AppLanguage.supported) {
    testWidgets(
      'paged list scrolls its header with the items (${lang.languageCode})',
      (tester) async {
        tester.view.physicalSize = const Size(320, 640);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        AppLanguage.current = lang;
        await tester.pumpWidget(
          _app(
            PagedList<String>(
              emptyText: tr('لا توجد نتائج'),
              header: Container(
                height: 200,
                color: Colors.amber,
                alignment: Alignment.topCenter,
                child: const Text('header'),
              ),
              fetch: (page) async => PagedResult<String>(
                items: List.generate(12, (i) => 'item $i'),
                currentPage: 1,
                lastPage: 1,
                total: 12,
              ),
              itemBuilder: (context, item, _) => ModuleCard(
                child: Text(item),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        expect(find.text('item 0'), findsOneWidget);

        await tester.drag(find.text('item 0'), const Offset(0, -300));
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        final header = find.text('header', skipOffstage: false);
        expect(tester.getRect(header).bottom, lessThan(0));
      },
    );
  }

  testWidgets('search waits for typing to pause, Enter searches at once',
      (tester) async {
    final queries = <String>[];
    await tester.pumpWidget(
      _app(
        ModuleSearchBar(
          hint: 'بحث',
          onSearch: (value) => queries.add(value),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'أحم');
    await tester.pump(const Duration(milliseconds: 100));
    expect(queries, isEmpty);

    await tester.pump(const Duration(milliseconds: 400));
    expect(queries, ['أحم']);

    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pump();
    expect(queries, ['أحم']);
  });
}
