class ProductRecommendModel {
  String? id;
  num? version;
  num? score;
  Payload? payload;
  dynamic vector;
  dynamic shardKey;
  dynamic orderValue;

  ProductRecommendModel({
    this.id = '',
    this.version = 0,
    this.score = 0,
    this.payload,
    this.vector = '',
    this.shardKey = '',
    this.orderValue = '',
  });

  factory ProductRecommendModel.fromJson(Map<String, dynamic> json) =>
      ProductRecommendModel(
        id: json["id"] ?? '',
        version: json["version"] ?? 0,
        score: json["score"] ?? 0,
        payload: json["payload"] == null
            ? Payload()
            : Payload.fromJson(json["payload"]),
        vector: json["vector"] ?? '',
        shardKey: json["shard_key"] ?? '',
        orderValue: json["order_value"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "score": score,
        "payload": payload?.toJson(),
        "vector": vector,
        "shard_key": shardKey,
        "order_value": orderValue,
      };

  //toString method
  @override
  String toString() {
    return 'ProductRecommendModel{id: $id, version: $version, score: $score, payload: $payload, vector: $vector, shardKey: $shardKey, orderValue: $orderValue}';
  }
}

class Payload {
  num? averageRating;
  num? categoryId;
  String? description;
  String? image;
  num? oldPrice;
  num? price;
  String? productId;
  String? productName;
  String? productNameEn;
  String? shopId;
  num? totalPurchases;
  num? totalReviews;

  Payload({
    this.averageRating = 0,
    this.categoryId = 0,
    this.description = '',
    this.image = '',
    this.oldPrice = 0,
    this.price = 0,
    this.productId = '',
    this.productName = '',
    this.productNameEn = '',
    this.shopId = '',
    this.totalPurchases = 0,
    this.totalReviews = 0,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        averageRating: json["average_rating"] ?? 0,
        categoryId: json["category_id"] ?? 0,
        description: json["description"] ?? '',
        image: json["image"] ?? '',
        oldPrice: json["old_price"] ?? 0,
        price: json["price"] ?? 0,
        productId: json["product_id"] ?? '',
        productName: json["product_name"] ?? '',
        productNameEn: json["product_name_en"] ?? '',
        shopId: json["shop_id"] ?? '',
        totalPurchases: json["total_purchases"] ?? 0,
        totalReviews: json["total_reviews"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "category_id": categoryId,
        "description": description,
        "image": image,
        "old_price": oldPrice,
        "price": price,
        "product_id": productId,
        "product_name": productName,
        "product_name_en": productNameEn,
        "shop_id": shopId,
        "total_purchases": totalPurchases,
        "total_reviews": totalReviews,
      };
}
