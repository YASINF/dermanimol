import 'package:data/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('yol ve kanal adları kimliği içerir', () {
    expect(ApiPaths.responses('r1'), '/requests/r1/responses');
    expect(RealtimeChannels.pharmacy('p1'), 'pharmacy:p1');
  });
}
