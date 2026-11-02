import 'package:dermanimol_yonetim/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('uygulama adını gösterir', (tester) async {
    await tester.pumpWidget(const DermanimOlYonetimApp());
    expect(find.text('Dermanım Ol Yönetim'), findsOneWidget);
  });
}
