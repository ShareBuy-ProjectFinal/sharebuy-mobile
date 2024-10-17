import 'package:share_buy/models/product/product_detail_model.dart';

class CartItemModel {
  String? id;
  String? status;
  String? userId;
  num? quantity;
  String? shopId;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProductDetailModel productDetail;

  CartItemModel({
    this.id,
    this.status,
    this.userId,
    this.quantity,
    this.shopId,
    this.createdAt,
    this.updatedAt,
    required this.productDetail,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json["_id"],
        status: json["status"],
        userId: json["user_id"],
        quantity: json["quantity"],
        shopId: json["shop_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        productDetail: json["product_detail"] == null
            ? ProductDetailModel()
            : ProductDetailModel.fromJson(json["product_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "user_id": userId,
        "quantity": quantity,
        "shop_id": shopId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "product_detail": productDetail.toJson(),
      };
}
