import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';

class CustomAttribute {
  String? id;
  String? shopId;
  String? attributeName;
  List<CustomAttributeValue>? customAttributeValues;

  CustomAttribute({
    this.id,
    this.shopId,
    this.attributeName,
    this.customAttributeValues,
  });

  factory CustomAttribute.fromJson(Map<String, dynamic> json) =>
      CustomAttribute(
        id: json["_id"] ?? '',
        shopId: json["shop_id"] ?? '',
        attributeName: json["attribute_name"] ?? '',
        customAttributeValues: json["custom_attribute_values"] == null
            ? []
            : List<CustomAttributeValue>.from(json["custom_attribute_values"]
                .map((x) => CustomAttributeValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "shop_id": shopId,
        "attribute_name": attributeName,
        "custom_attribute_values":
            List<dynamic>.from(customAttributeValues!.map((x) => x.toJson())),
      };
}
