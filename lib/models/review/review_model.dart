import 'package:share_buy/models/user/user_model.dart';

class ReviewModel {
  String? id;
  List<String>? images;
  String? productId;
  String? userId;
  num? rating;
  String? reviewContent;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? user;

  ReviewModel({
    this.id = '',
    this.images = const [],
    this.productId = '',
    this.userId = '',
    this.rating = 0,
    this.reviewContent = '',
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  ReviewModel copyWith({
    String? id,
    List<String>? images,
    String? productId,
    String? userId,
    num? rating,
    String? reviewContent,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ReviewModel(
        id: id ?? this.id,
        images: images ?? this.images,
        productId: productId ?? this.productId,
        userId: userId ?? this.userId,
        rating: rating ?? this.rating,
        reviewContent: reviewContent ?? this.reviewContent,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["_id"] ?? '',
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        productId: json["product_id"] ?? '',
        userId: json["user_id"] ?? '',
        rating: json["rating"] ?? 0,
        reviewContent: json["review_content"] ?? '',
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "product_id": productId,
        "user_id": userId,
        "rating": rating,
        "review_content": reviewContent,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}
