import 'package:share_buy/models/cart/cart_item_model.dart';

class OrderItemModel {
  String? id;
  String? status;
  String? shopId;
  String? orderId;
  String? customerId;
  String? cartItemId;
  num? totalPrice;
  num? feeShip;
  num? totalAmount;
  DateTime? createdAt;
  DateTime? updatedAt;
  CartItemModel? cartItem;

  OrderItemModel({
    this.id = '',
    this.status = '',
    this.shopId = '',
    this.orderId = '',
    this.customerId = '',
    this.cartItemId = '',
    this.totalPrice = 0,
    this.feeShip = 0,
    this.totalAmount = 0,
    this.createdAt,
    this.updatedAt,
    this.cartItem,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        id: json["_id"] ?? '',
        status: json["status"] ?? '',
        shopId: json["shop_id"] ?? '',
        orderId: json["order_id"] ?? '',
        customerId: json["customer_id"] ?? '',
        cartItemId: json["cart_item_id"] ?? '',
        totalPrice: json["total_price"] ?? 0,
        feeShip: json["fee_ship"] ?? 0,
        totalAmount: json["total_amount"] ?? 0,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        cartItem: json["cart_item"] == null
            ? null
            : CartItemModel.fromJson(json["cart_item"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "shop_id": shopId,
        "order_id": orderId,
        "customer_id": customerId,
        "cart_item_id": cartItemId,
        "total_price": totalPrice,
        "fee_ship": feeShip,
        "total_amount": totalAmount,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "cart_item": cartItem?.toJson(),
      };
}
