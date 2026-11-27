import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/providers/screen_data_provider.dart';

/// A screen that loads with [screenDataProvider] and reloads on demand.
class _Screen extends ConsumerStatefulWidget {
  const _Screen(this.load);
  final Future<String> Function(int attempt) load;

  @override
  ConsumerState<_Screen> createState() => _ScreenState();
}

class _ScreenState extends ConsumerState<_Screen> {
  int attempt = 0;
  late final provider = screenDataProvider(() => widget.load(++attempt));

  @override
  Widget build(BuildContext context) {
    return switch (ref.watch(provider)) {
      AsyncData(:final value) => Text('data $value'),
      AsyncError(:final error) => TextButton(
          onPressed: () => reloadScreenData(ref, provider),
          child: Text('error $error'),
        ),
      _ => const Text('loading'),
    };
  }
}

void main() {
  testWidgets('loads, shows the error, and reloads with fresh state',
      (tester) async {
    await tester.pumpWidget(ProviderScope(
      child: MaterialApp(
        home: _Screen((attempt) async {
          if (attempt == 1) throw 'offline';
          return 'ok $attempt';
        }),
      ),
    ));
    expect(find.text('loading'), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('error offline'), findsOneWidget);

    await tester.tap(find.text('error offline'));
    await tester.pumpAndSettle();
    expect(find.text('data ok 2'), findsOneWidget);
  });
}
