/// Veri modelindeki enum'ların Dart karşılıkları (docs/03-veri-modeli.md, bölüm 3).
///
/// Her değer veritabanındaki yazımını [DbEnum.dbValue] ile taşır.
abstract interface class DbEnum {
  String get dbValue;
}

T _fromDb<T extends DbEnum>(List<T> values, String raw) => values.firstWhere(
  (v) => v.dbValue == raw,
  orElse: () => throw ArgumentError.value(raw, 'raw', 'Bilinmeyen değer'),
);

enum ProductKind implements DbEnum {
  drug('drug'),
  care('care');

  const ProductKind(this.dbValue);
  @override
  final String dbValue;
  static ProductKind fromDb(String raw) => _fromDb(values, raw);
}

enum RequestStatus implements DbEnum {
  sent('sent'),
  collecting('collecting'),
  closed('closed');

  const RequestStatus(this.dbValue);
  @override
  final String dbValue;
  static RequestStatus fromDb(String raw) => _fromDb(values, raw);
}

enum CloseReason implements DbEnum {
  expired('expired'),
  userClosed('user_closed'),
  noTargets('no_targets');

  const CloseReason(this.dbValue);
  @override
  final String dbValue;
  static CloseReason fromDb(String raw) => _fromDb(values, raw);
}

enum TargetStatus implements DbEnum {
  pending('pending'),
  responded('responded'),
  expired('expired'),
  skipped('skipped'),
  cancelled('cancelled');

  const TargetStatus(this.dbValue);
  @override
  final String dbValue;
  static TargetStatus fromDb(String raw) => _fromDb(values, raw);
}

enum Availability implements DbEnum {
  available('available'),
  equivalent('equivalent'),
  unavailable('unavailable');

  const Availability(this.dbValue);
  @override
  final String dbValue;
  static Availability fromDb(String raw) => _fromDb(values, raw);
}

enum IntentStatus implements DbEnum {
  active('active'),
  arrived('arrived'),
  noShow('no_show'),
  cancelled('cancelled');

  const IntentStatus(this.dbValue);
  @override
  final String dbValue;
  static IntentStatus fromDb(String raw) => _fromDb(values, raw);
}

enum FeedbackAnswer implements DbEnum {
  yes('yes'),
  partial('partial'),
  no('no');

  const FeedbackAnswer(this.dbValue);
  @override
  final String dbValue;
  static FeedbackAnswer fromDb(String raw) => _fromDb(values, raw);
}

enum PharmacyStatus implements DbEnum {
  pending('pending'),
  approved('approved'),
  rejected('rejected'),
  suspended('suspended');

  const PharmacyStatus(this.dbValue);
  @override
  final String dbValue;
  static PharmacyStatus fromDb(String raw) => _fromDb(values, raw);
}

enum MemberRole implements DbEnum {
  owner('owner'),
  pharmacist('pharmacist'),
  staff('staff');

  const MemberRole(this.dbValue);
  @override
  final String dbValue;
  static MemberRole fromDb(String raw) => _fromDb(values, raw);
}
