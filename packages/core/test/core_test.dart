import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ayar verilmezse dev ortamı ve yerel API kullanılır', () {
    final config = AppConfig.fromEnvironment();
    expect(config.environment, AppEnvironment.dev);
    expect(config.apiBaseUrl, 'http://localhost:8000');
    expect(config.isProd, isFalse);
  });
}
