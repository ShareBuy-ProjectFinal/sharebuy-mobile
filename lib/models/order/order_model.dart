import 'package:share_buy/models/address/address_model.dart';
import 'package:share_buy/models/order/order_item_model.dart';
import 'package:share_buy/models/order/page_info_model.dart';
import 'package:share_buy/models/shop/shop_model.dart';

class OrderModel {
  String? id;
  String? status;
  String? type;
  String? customerId;
  String? paymentMethod;
  AddressModel? address;
  String? orderParent;
  String? shopId;
  num? totalAmount;
  num? feeShip;
  DateTime? createdAt;
  DateTime? updatedAt;
  ShopModel? shop;
  List<OrderItemModel>? orderItems;
  PaymentInfoModel? paymentInfo;
  List<OrderModel>? ordersGroupByShop;

  OrderModel({
    this.id = '',
    this.status = '',
    this.type = '',
    this.customerId = '',
    this.paymentMethod = '',
    this.address,
    this.orderParent = '',
    this.shopId = '',
    this.totalAmount = 0,
    this.feeShip = 0,
    this.createdAt,
    this.updatedAt,
    this.shop,
    this.orderItems = const [],
    this.paymentInfo,
    this.ordersGroupByShop = const [],
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["_id"] ?? '',
        status: json["status"] ?? '',
        type: json["type"] ?? '',
        customerId: json["customer_id"] ?? '',
        paymentMethod: json["payment_method"] ?? '',
        address: json["address"] == null
            ? null
            : AddressModel.fromJson(json["address"]),
        orderParent: json["order_parent"] ?? '',
        shopId: json["shop_id"] ?? '',
        totalAmount: json["total_amount"] ?? 0,
        feeShip: json["fee_ship"] ?? 0,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        shop: json["shop"] == null ? null : ShopModel.fromJson(json["shop"]),
        orderItems: json["order_items"] == null
            ? []
            : List<OrderItemModel>.from(
                json["order_items"]!.map((x) => OrderItemModel.fromJson(x))),
        paymentInfo: json["payment_info"] == null
            ? null
            : PaymentInfoModel.fromJson(json["payment_info"]),
        ordersGroupByShop: json["orders_group_by_shop"] == null
            ? []
            : List<OrderModel>.from(json["orders_group_by_shop"]!
                .map((x) => OrderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "type": type,
        "customer_id": customerId,
        "payment_method": paymentMethod,
        "address": address?.toJson(),
        "order_parent": orderParent,
        "shop_id": shopId,
        "total_amount": totalAmount,
        "fee_ship": feeShip,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "shop": shop?.toJson(),
        "order_items": orderItems == null
            ? []
            : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
        "payment_info": paymentInfo?.toJson(),
        "orders_group_by_shop": ordersGroupByShop == null
            ? []
            : List<dynamic>.from(ordersGroupByShop!.map((x) => x.toJson())),
      };
}

extension OrderModelExtension on OrderModel {
  num get getCountCartItem {
    return ordersGroupByShop!.fold<num>(
        0,
        (previousValue, element) =>
            previousValue +
            element.orderItems!.fold(
                0,
                (previousValue, element) =>
                    previousValue + element.cartItem!.quantity!.toInt()));
  }
}
