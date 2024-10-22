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

extension CartModelExtension on List<CartModel> {
  List<CartModel> getCartItemSelected() {
    List<CartModel> result = [];
    for (var cart in this) {
      if (cart.shop?.isSelected ?? false) {
        result.add(cart);
      } else {
        List<CartItemModel> cartItems =
            cart.cartItems!.where((item) => item.isSelected ?? false).toList();
        if (cartItems.isNotEmpty) {
          result.add(CartModel(cartItems: cartItems, shop: cart.shop));
        }
      }
    }
    return result;
  }

  bool isSelected() {
    return any((cart) {
      if (cart.shop?.isSelected ?? false) {
        return true;
      }
      if (cart.cartItems!.any((item) => item.isSelected ?? false)) {
        return true;
      }
      return false;
    });
  }

  num totalSelected() {
    // return fold<num>(0, (previousValue, element) {
    //   return previousValue +
    //       element.cartItems!.fold<num>(0, (previousValue, element) {
    //         return previousValue +
    //             element.productDetail.price! * element.quantity!;
    //       });
    // });

    return fold<num>(0, (pre, element) {
      return pre +
          element.cartItems!.fold<num>(0, (preElement, cartItem) {
            return cartItem.isSelected ?? false
                ? preElement + cartItem.productDetail.price * cartItem.quantity!
                : preElement;
          });
    });
  }
}
