import 'package:dermanimol/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('uygulama adını gösterir', (tester) async {
    await tester.pumpWidget(const DermanimOlApp());
    expect(find.text('Dermanım Ol'), findsOneWidget);
  });
}
