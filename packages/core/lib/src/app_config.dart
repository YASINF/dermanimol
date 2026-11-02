/// Uygulamanın çalıştığı ortam.
enum AppEnvironment { dev, staging, prod }

/// Derleme anında `--dart-define` ile verilen ayarlar.
///
/// Örnek:
/// `flutter run --dart-define=APP_ENV=dev --dart-define=API_BASE_URL=http://localhost:8000`
class AppConfig {
  const AppConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.supabaseUrl,
    required this.supabaseAnonKey,
  });

  factory AppConfig.fromEnvironment() {
    const env = String.fromEnvironment('APP_ENV', defaultValue: 'dev');
    return AppConfig(
      environment: AppEnvironment.values.firstWhere(
        (e) => e.name == env,
        orElse: () => AppEnvironment.dev,
      ),
      apiBaseUrl: const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: 'http://localhost:8000',
      ),
      supabaseUrl: const String.fromEnvironment('SUPABASE_URL'),
      supabaseAnonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
    );
  }

  final AppEnvironment environment;
  final String apiBaseUrl;
  final String supabaseUrl;

  /// Sadece anon key. Service role anahtarı hiçbir zaman istemciye konmaz.
  final String supabaseAnonKey;

  bool get isProd => environment == AppEnvironment.prod;
}
