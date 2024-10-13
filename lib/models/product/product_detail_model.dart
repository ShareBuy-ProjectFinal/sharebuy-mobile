import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/product/product_model.dart';

class ProductDetailModel {
  String? id;
  List<CustomAttributeValue>? customAttributeValues;
  ProductModel? product;
  String? name;
  num? price;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? quantity;

  ProductDetailModel({
    this.id,
    this.customAttributeValues,
    this.product,
    this.name,
    this.price,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.quantity,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["_id"] ?? '',
        customAttributeValues: json["custom_attribute_values"] == null
            ? []
            : List<CustomAttributeValue>.from(json["custom_attribute_values"]!
                .map((x) => CustomAttributeValue.fromJsonProductDetail(x))),
        product: json["product"] == null
            ? null
            : ProductModel.fromJson(json["product"]),
        name: json["name"] ?? '',
        price: json["price"] ?? 0,
        image: json["image"] ?? '',
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "custom_attribute_values": customAttributeValues == null
            ? []
            : List<dynamic>.from(customAttributeValues!.map((x) => x.toJson())),
        "product": product?.toJson(),
        "name": name,
        "price": price,
        "image": image,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "quantity": quantity,
      };
}
