import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('veritabanı yazımı iki yönde de eşleşir', () {
    for (final v in CloseReason.values) {
      expect(CloseReason.fromDb(v.dbValue), v);
    }
    expect(IntentStatus.fromDb('no_show'), IntentStatus.noShow);
  });

  test('bilinmeyen değer hata verir', () {
    expect(() => Availability.fromDb('maybe'), throwsArgumentError);
  });
}
