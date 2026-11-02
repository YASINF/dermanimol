import 'package:dermanimol_eczaci/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('uygulama adını gösterir', (tester) async {
    await tester.pumpWidget(const DermanimOlEczaciApp());
    expect(find.text('Dermanım Ol Eczacı'), findsOneWidget);
  });
}
