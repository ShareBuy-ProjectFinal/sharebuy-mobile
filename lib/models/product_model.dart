class ProductModel {
  String? name;
  dynamic price;
  dynamic saleOffPercent;
  dynamic salePrice;
  String? imageUrl;

  ProductModel(
      {this.name,
      this.price,
      this.saleOffPercent,
      this.salePrice,
      this.imageUrl});
}
