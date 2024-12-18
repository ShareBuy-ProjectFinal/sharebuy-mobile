import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/address_bloc/address_bloc.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/blocs/cart_bloc/cart_state.dart';
import 'package:share_buy/enums/PayType.dart';
import 'package:share_buy/models/cart/cart_model.dart';
import 'package:share_buy/utils/format.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/snack_bar.dart';
import 'package:share_buy/widgets/purchase/children/location_item.dart';
import 'package:share_buy/widgets/purchase/children/purchase_bottom_screen.dart';
import 'package:share_buy/widgets/purchase/children/purchase_shop.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AddressBloc>().state.selectedAddress =
        AuthBloc.currentUser?.address;
  }

  @override
  Widget build(BuildContext context) {
    List<CartModel> carts =
        context.read<CartBloc>().state.carts.getCartItemSelected();
    return BlocListener<CartBloc, CartState>(
      listener: (BuildContext context, CartState state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
          if (state.isSuccues) {
            if (state.payType == PayType.direct) {
              //chuyển sáng tab đơn hàng
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  NavigatorName.HOME_SCREEN,
                  arguments: {'currentIndex': 3, 'currentTabInderOrder': 1},
                  (route) => false);
              MessageToast.showToast(context, "Đặt hàng thành công");
            } else {
              //chuyển sáng tab thanh toán
              Navigator.pushNamed(context, NavigatorName.PAY_WEB_SCREEN,
                  arguments: {'url': state.payUrl});
            }
          }
          // else {
          //   MessageToast.showToast(context, "Đặt hàng thất bại");
          // }
        }

        if (state.isShowMessageToast) {
          state.isShowMessageToast = false;
          if (ModalRoute.of(context)?.isCurrent == true) {
            MessageToast.showToast(context, state.message);
          }
          state.message = '';
        }
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          // elevation: 400.0,
          // shadowColor: Colors.yellow.withOpacity(0.95),
          title: Text(
            'Đặt hàng',
            style: AppTypography.headerAppbarStyle,
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.backgroundGrey),
                    child: ListView(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        children: [
                          LocationItem(),
                          SizedBox(
                            height: 10.h,
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => PurchaseShop(
                              cart: carts[index],
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                            itemCount: carts.length,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          PurchaseBottomScreen(),
                        ]),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Màu của shadow
                        spreadRadius: 0, // Bán kính lan tỏa của shadow
                        blurRadius: 2, // Bán kính mờ của shadow
                        offset: Offset(0, -2),
                      )
                    ],
                  ),
                  child: Row(
                    //tổng tiền
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Tổng cộng',
                              style: AppTypography.primaryHintText,
                            ),
                            Text(
                              '${Format.formatNumber(carts.totalSelected() + carts.length * 20000)} vnđ',
                              style: AppTypography.largeDarkBlueBold,
                            )
                          ]),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomButton(
                        buttonColor: AppColors.buttonBlue,
                        buttonText: "Đặt hàng",
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 15.h),
                        onTap: () {
                          if (context
                                  .read<AddressBloc>()
                                  .state
                                  .selectedAddress ==
                              null) {
                            MessageToast.showToast(
                                context, "Chưa có địa chỉ giao hàng");
                            return;
                          }
                          context
                              .read<CartBloc>()
                              .add(EventPurchaseCart(carts: carts));
                        },
                        textColor: Colors.white,
                        fontSize: 18.sp,
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
