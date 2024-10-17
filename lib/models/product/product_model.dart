import 'package:share_buy/models/attribute/attribute_custom_model.dart';
import 'package:share_buy/models/product/product_detail_model.dart';
import 'package:share_buy/models/shop/shop_model.dart';

class ProductModel {
  String? id;
  List<String>? images;
  List<CustomAttribute>? customAttributes;
  String? productName;
  num? oldPrice;
  num? price;
  String? description;
  String? image;
  num? categoryId;
  String? shopId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? categoryName;
  num? quantity;
  num? totalReviews;
  num? averageRating;
  num? totalPurchases;
  List<ProductDetailModel>? productDetails;
  ShopModel? shop;

  ProductModel({
    this.id = '',
    this.images = const [],
    this.customAttributes = const [],
    this.productName = '',
    this.oldPrice = 0,
    this.price = 0,
    this.description = '',
    this.image = '',
    this.categoryId = 0,
    this.shopId = '',
    this.createdAt,
    this.updatedAt,
    this.categoryName = '',
    this.quantity = 0,
    this.totalReviews = 0,
    this.averageRating = 0,
    this.totalPurchases = 0,
    this.productDetails = const [],
    required this.shop,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"] ?? '',
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"].map((x) => x ?? '')),
        customAttributes: json["custom_attributes"] == null
            ? []
            : List<CustomAttribute>.from(json["custom_attributes"]
                .map((x) => CustomAttribute.fromJson(x))),
        productName: json["product_name"] ?? '',
        oldPrice: json["old_price"] ?? 0,
        price: json["price"] ?? 0,
        description: json["description"] ?? '',
        image: json["image"] ?? '',
        categoryId: json["category_id"] ?? 0,
        shopId: json["shop_id"] ?? '',
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["updatedAt"]),
        categoryName: json["category_name"] ?? '',
        quantity: json["quantity"] ?? 0,
        totalReviews: json["total_reviews"] ?? 0,
        averageRating: json["average_rating"] ?? 0,
        totalPurchases: json["total_purchases"] ?? 0,
        productDetails: json["product_details"] == null
            ? []
            : List<ProductDetailModel>.from(json["product_details"]
                .map((x) => ProductDetailModel.fromJson(x))),
        shop: json["shop"] == null
            ? ShopModel()
            : ShopModel.fromJson(json["shop"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "custom_attributes": customAttributes == null
            ? []
            : List<dynamic>.from(customAttributes!.map((x) => x.toJson())),
        "product_name": productName,
        "old_price": oldPrice,
        "price": price,
        "description": description,
        "image": image,
        "category_id": categoryId,
        "shop_id": shopId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "category_name": categoryName,
        "quantity": quantity,
        "total_reviews": totalReviews,
        "average_rating": averageRating,
        "total_purchases": totalPurchases,
        "product_details": productDetails == null
            ? []
            : List<dynamic>.from(productDetails!.map((x) => x.toJson())),
        "shop": shop?.toJson(),
      };
}
