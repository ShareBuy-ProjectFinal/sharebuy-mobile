import 'package:flutter/material.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/widgets/cart/children/cart_item.dart';

class CartShopItem extends StatefulWidget {
  const CartShopItem({super.key});

  @override
  State<CartShopItem> createState() => _CartShopItemState();
}

class _CartShopItemState extends State<CartShopItem> {
  @override
  Widget build(BuildContext context) {
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
                    'Name shop >',
                    style: AppTypography.primaryDarkBlueBold,
                  )
                ],
              ),
              Column(
                children: List.generate(2, (index) {
                  return const CartItem();
                }),
              )
            ],
          )),
    );
  }
}
