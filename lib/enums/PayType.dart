enum PayType { direct, momo }

extension PayTypeExtension on PayType {
  String get displayName {
    switch (this) {
      case PayType.direct:
        return 'DIRECT';
      case PayType.momo:
        return 'MOMO';
      default:
        return '';
    }
  }
}
