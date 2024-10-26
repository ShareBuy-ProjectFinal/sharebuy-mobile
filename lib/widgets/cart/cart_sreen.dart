import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/blocs/cart_bloc/cart_state.dart';
import 'package:share_buy/models/cart/cart_model.dart';
import 'package:share_buy/utils/format.dart';
import 'package:share_buy/widgets/cart/children/cart_shop_item.dart';
import 'package:share_buy/widgets/cart/children/skelaton_screen.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/customer_loading.dart';
import 'package:share_buy/widgets/component/snack_bar.dart';

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
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (BuildContext context, state) {
        if (state.isLoading) {
          // context.loaderOverlay.show();
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
          return state.isLoading
              ? CustomerLoading(templateItem: SkelatonScreen())
              : Column(
                  children: [
                    Expanded(
                      child: state.carts.isEmpty
                          ? const SizedBox()
                          : Container(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              decoration: const BoxDecoration(
                                  color: AppColors.backgroundGrey),
                              child: ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
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
                        Checkbox(
                            value: state.carts.isSelectedAll(),
                            onChanged: (value) {
                              context.read<CartBloc>().add(
                                  EventSelectItemCartCheckbox(
                                      value: value!, type: TypeCheckBox.all));
                            }),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Tổng cộng',
                                  style: AppTypography.hintTextStyleBold,
                                ),
                                Text(
                                  '${Format.formatNumber(state.carts.totalSelected())} vnđ',
                                  style: AppTypography.largeDarkBlueBold,
                                ),
                              ],
                            ),
                            SizedBox(width: 10.w),
                            CustomButton(
                              buttonColor: AppColors.buttonBlue,
                              buttonText: 'Mua hàng',
                              // disable: !state.carts.isSelected(),
                              onTap: () {
                                if (state.carts.isSelected()) {
                                  Navigator.pushNamed(
                                      context, NavigatorName.PURCHASE_SCREEN);
                                } else {
                                  MessageToast.showToast(
                                    context,
                                    "Bạn vẫn chưa chọn sản phẩm.",
                                  );
                                }
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
