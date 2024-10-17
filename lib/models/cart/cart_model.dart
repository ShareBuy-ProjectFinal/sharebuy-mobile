import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/shop/shop_model.dart';

class CartModel {
  List<CartItemModel>? cartItems;
  ShopModel? shop;

  CartModel({
    this.cartItems,
    this.shop,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cartItems: json["cartItems"] == null
            ? []
            : List<CartItemModel>.from(
                json["cartItems"]!.map((x) => CartItemModel.fromJson(x))),
        shop: json["shop"] == null ? null : ShopModel.fromJson(json["shop"]),
      );

  Map<String, dynamic> toJson() => {
        "cartItems": cartItems == null
            ? []
            : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
        "shop": shop?.toJson(),
      };
}
