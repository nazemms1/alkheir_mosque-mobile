import 'package:flutter_test/flutter_test.dart';
import 'package:alkheir_mosque/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AlkheirMosqueApp());
    expect(find.byType(AlkheirMosqueApp), findsOneWidget);
  });
}
