import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_state.dart';
import 'package:share_buy/widgets/cart/children/cart_item.dart';
import 'package:share_buy/widgets/cart/children/cart_shop_item.dart';
import 'package:share_buy/widgets/component/custom_button.dart';

class CartSreen extends StatefulWidget {
  const CartSreen({super.key});

  @override
  State<CartSreen> createState() => _CartSreenState();
}

class _CartSreenState extends State<CartSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Giỏ hàng',
          style: AppTypography.headerAppbarStyle,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: const BoxDecoration(color: AppColors.hintTextColor),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const CartShopItem();
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Row(
                children: [
                  Text('Tổng cộng: 100.000đ'),
                  SizedBox(width: 10.w),
                  CustomButton(
                    buttonColor: AppColors.buttonBlue,
                    buttonText: 'Mua hàng',
                    onTap: () {},
                    textColor: AppColors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
