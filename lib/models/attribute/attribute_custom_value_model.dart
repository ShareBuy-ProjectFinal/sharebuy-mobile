import 'package:share_buy/models/attribute/attribute_custom_model.dart';

class CustomAttributeValue {
  String? id;
  String? value;
  DateTime? createdAt;
  DateTime? updatedAt;
  CustomAttribute? customAttribute;

  CustomAttributeValue({
    this.id,
    this.value,
    this.createdAt,
    this.updatedAt,
    this.customAttribute,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomAttributeValue &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
  factory CustomAttributeValue.fromJson(Map<String, dynamic> json) =>
      CustomAttributeValue(
        id: json["_id"] ?? '',
        value: json["value"] ?? '',
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        customAttribute: json["custom_attribute"] == null
            ? null
            : CustomAttribute.fromJson(json["custom_attribute"]),
      );

  factory CustomAttributeValue.fromJsonProductDetail(
          Map<String, dynamic> json) =>
      CustomAttributeValue(
        id: json["_id"] ?? '',
        value: json["value"] ?? '',
        customAttribute: json["custom_attribute_id"] == null
            ? null
            : CustomAttribute.fromJson(json["custom_attribute_id"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "value": value,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "custom_attribut": customAttribute?.toJson(),
      };
}
