import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/cart/cart_model.dart';
import 'package:share_buy/widgets/cart/children/cart_item.dart';

class CartShopItem extends StatefulWidget {
  int indexCartShop;
  CartShopItem({super.key, required this.indexCartShop});

  @override
  State<CartShopItem> createState() => _CartShopItemState();
}

class _CartShopItemState extends State<CartShopItem> {
  @override
  Widget build(BuildContext context) {
    CartModel cart = context.read<CartBloc>().state.carts[widget.indexCartShop];

    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.grey),
              color: AppColors.white),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  Text(
                    cart.shop?.fullName ?? 'Name shop',
                    style: AppTypography.primaryDarkBlueBold,
                  )
                ],
              ),
              Column(
                children: List.generate(cart.cartItems?.length ?? 0, (index) {
                  return CartItem(
                    cartItem: cart.cartItems?[index],
                  );
                }),
              )
            ],
          )),
    );
  }
}
