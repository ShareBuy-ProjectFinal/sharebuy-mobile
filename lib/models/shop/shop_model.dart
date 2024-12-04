import 'package:share_buy/models/product/category_model.dart';

class ShopModel {
  String? id;
  String? state;
  List<CategoryModel>? categories;
  String? userName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? role;
  String? image;
  String? firebaseId;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isSelected;

  ShopModel({
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
    this.isSelected = false,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
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
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        isSelected: false,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "state": state,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "user_name": userName,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "role": role,
        "image": image,
        "firebase_id": firebaseId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        'isSelected': isSelected,
      };
}
