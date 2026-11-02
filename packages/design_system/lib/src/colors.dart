import 'package:flutter/painting.dart';

/// Dermanım Ol marka renkleri.
///
/// Değerler logodan ve açılış ekranından ölçüldü
/// (docs/01-urun-kararlari.md, "Marka kararı").
abstract final class AppColors {
  /// Lacivert: yazılar ve ana butonlar.
  static const navy = Color(0xFF12223E);

  /// Kırmızı: logodaki "E", vurgu ve nöbetçi işaretleri.
  static const red = Color(0xFFCA3A31);

  /// Mavi: bağlantılar ve seçili durumlar.
  static const blue = Color(0xFF3982C2);

  /// Açık mavi zemin.
  static const background = Color(0xFFEEF5FD);

  static const surface = Color(0xFFFFFFFF);
  static const muted = Color(0xFF5A6372);
  static const line = Color(0xFFD5E1EE);

  /// Durum renkleri: "Var", "Muadil", "Yok".
  static const available = Color(0xFF15803D);
  static const equivalent = Color(0xFFB45309);
  static const unavailable = red;

  // Koyu tema karşılıkları.
  static const darkBackground = Color(0xFF0A1322);
  static const darkSurface = Color(0xFF132139);
  static const darkInk = Color(0xFFE7EEF8);
  static const darkPrimary = Color(0xFF5AA2DD);
  static const darkRed = Color(0xFFE5584E);
}
