import 'package:share_buy/models/address/address_model.dart';
import 'package:share_buy/models/product/category_model.dart';

class UserModel {
  String? id;
  String? state;
  List<CategoryModel>? categories;
  String? userName;
  String? fullName;
  String? email;
  dynamic phoneNumber;
  String? role;
  String? image;
  String? firebaseId;
  DateTime? createdAt;
  DateTime? updatedAt;
  AddressModel? address;

  UserModel({
    this.id = '',
    this.state = '',
    this.categories = const [],
    this.userName = '',
    this.fullName = '',
    this.email = '',
    this.phoneNumber = '',
    this.role = '',
    this.image = '',
    this.firebaseId = '',
    this.createdAt,
    this.updatedAt,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"] ?? '',
        state: json["state"] ?? '',
        categories: json["categories"] == null
            ? []
            : List<CategoryModel>.from(
                json["categories"].map((x) => CategoryModel.fromJson(x))),
        userName: json["user_name"] ?? '',
        fullName: json["full_name"] ?? '',
        email: json["email"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        role: json["role"] ?? '',
        image: json["image"] ?? '',
        firebaseId: json["firebase_id"] ?? '',
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["updatedAt"]),
        address: json["default_address"] == null
            ? null
            : AddressModel.fromJson(json["default_address"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "state": state,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "user_name": userName,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "role": role,
        "image": image,
        "firebase_id": firebaseId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "default_address": address?.toJson(),
        "default_address_id": address?.id,
      };
}
