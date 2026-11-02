/// Backend API yolları (docs/03-veri-modeli.md, bölüm 5).
abstract final class ApiPaths {
  // Kullanıcı
  static const requests = '/requests';
  static String closeRequest(String id) => '/requests/$id/close';
  static const intents = '/intents';
  static String cancelIntent(String id) => '/intents/$id/cancel';
  static const feedbacks = '/feedbacks';
  static const phoneVerify = '/phone/verify';
  static const me = '/me';

  // Eczacı
  static String responses(String requestId) => '/requests/$requestId/responses';
  static String targetSeen(String id) => '/targets/$id/seen';
  static String resolveIntent(String id) => '/intents/$id/resolve';
  static const reports = '/reports';
  static const closedOverride = '/pharmacy/closed-override';
}

/// Realtime kanal adları (docs/04-teknik-mimari.md).
abstract final class RealtimeChannels {
  static String request(String id) => 'request:$id';
  static String pharmacy(String id) => 'pharmacy:$id';
}
