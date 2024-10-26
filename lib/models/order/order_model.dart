import 'package:share_buy/models/address/address_model.dart';
import 'package:share_buy/models/order/page_info_model.dart';

class OrderModel {
  AddressModel? address;
  String? status;
  String? type;
  String? id;
  String? customerId;
  String? paymentMethod;
  int? totalAmount;
  int? feeShip;
  DateTime? createdAt;
  DateTime? updatedAt;
  PaymentInfoModel? paymentInfo;

  OrderModel({
    this.address,
    this.status,
    this.type,
    this.id,
    this.customerId,
    this.paymentMethod,
    this.totalAmount,
    this.feeShip,
    this.createdAt,
    this.updatedAt,
    this.paymentInfo,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        address: json["address"] == null
            ? null
            : AddressModel.fromJson(json["address"]),
        status: json["status"] ?? '',
        type: json["type"] ?? '',
        id: json["_id"] ?? '',
        customerId: json["customer_id"] ?? '',
        paymentMethod: json["payment_method"] ?? '',
        totalAmount: json["total_amount"] ?? 0,
        feeShip: json["fee_ship"] ?? 0,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        paymentInfo: json["payment_info"] == null
            ? null
            : PaymentInfoModel.fromJson(json["payment_info"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "status": status,
        "type": type,
        "_id": id,
        "customer_id": customerId,
        "payment_method": paymentMethod,
        "total_amount": totalAmount,
        "fee_ship": feeShip,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "payment_info": paymentInfo?.toJson(),
      };
}
