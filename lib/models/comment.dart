import 'package:share_buy/models/product_model.dart';

class Comment {
  String? avatarUrl;
  String? name;
  String? comment;
  List<String> imageUrls = [];
  ProductTestModel? productModel;
  DateTime? commentTime;

  Comment(
      {this.avatarUrl = '',
      this.name = '',
      this.comment = '',
      this.imageUrls = const [],
      this.commentTime,
      this.productModel});
}
