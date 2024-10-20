import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/blocs/cart_bloc/cart_state.dart';
import 'package:share_buy/utils/format.dart';
import 'package:share_buy/widgets/cart/children/cart_shop_item.dart';
import 'package:share_buy/widgets/component/custom_button.dart';

class CartSreen extends StatefulWidget {
  const CartSreen({super.key});

  @override
  State<CartSreen> createState() => _CartSreenState();
}

class _CartSreenState extends State<CartSreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(CartLoadingEvent());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    log("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (BuildContext context, state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          backgroundColor: AppColors.white,
          title: Center(
            child: Text(
              'Giỏ hàng',
              style: AppTypography.headerAppbarStyle,
            ),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
            child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          num total = 0;
          state.carts.forEach((cart) {
            cart.cartItems?.forEach((cartItem) {
              if (cartItem.isSelected ?? false) {
                total +=
                    cartItem.productDetail.price * (cartItem.quantity ?? 1);
              }
            });
          });
          return state.isLoading
              ? const SizedBox()
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          decoration: const BoxDecoration(
                              color: AppColors.hintTextColor),
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 5.h),
                            shrinkWrap: true,
                            itemCount: state.carts.length,
                            itemBuilder: (context, index) {
                              return CartShopItem(
                                indexCartShop: index,
                              );
                            },
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Row(
                          children: [
                            Text('Tổng cộng: ${Format.formatNumber(total)}'),
                            SizedBox(width: 10.w),
                            CustomButton(
                              buttonColor: AppColors.buttonBlue,
                              buttonText: 'Mua hàng',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, NavigatorName.PURCHASE_SCREEN);
                              },
                              textColor: AppColors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
        })),
      ),
    );
  }
}
