import 'dart:developer';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/home_bloc/home_bloc.dart';
import 'package:share_buy/blocs/order_bloc/order_bloc.dart';
import 'package:share_buy/blocs/order_bloc/order_event.dart';
import 'package:share_buy/blocs/order_bloc/order_state.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/product_item.dart';
import 'package:share_buy/widgets/order/children/ordered_item.dart';
import 'package:text_divider/text_divider.dart';

class TabToPay extends StatefulWidget {
  const TabToPay({super.key});

  @override
  State<TabToPay> createState() => _TabToPayState();
}

class _TabToPayState extends State<TabToPay> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OrderBloc>().add(EventLoadingOrderTopay());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (BuildContext context, OrderState state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
        List<ProductRecommendModel> productsRecommend =
            context.read<HomeBloc>().state.products;
        return Container(
          decoration: const BoxDecoration(color: AppColors.backgroundGrey),
          child: ListView(
            children: [
              state.ordersToPay.length != 0
                  ? ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      itemCount: state.ordersToPay.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Column(
                              children: [
                                OrderedItem(
                                  order: state.ordersToPay[index],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomButton(
                                      buttonColor: AppColors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      buttonText: 'Đổi phương thức thanh toán',
                                      onTap: () {
                                        log('Change payment method tab pay_to');
                                      },
                                      textColor: AppColors.textBlack,
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    CustomButton(
                                      buttonColor: AppColors.buttonBlue,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      buttonText: 'Thanh toán',
                                      onTap: () {
                                        log('Change payment method tab pay_to');
                                      },
                                      textColor: AppColors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 60.h),
                      child: Column(
                        children: [
                          Icon(
                            Icons.receipt_long,
                            size: 60.w,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                            child: Text(
                              "Bạn chưa có đơn nào cả",
                              style: AppTypography.mediumBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
              TextDivider.horizontal(
                  text: Text(
                    "Có thể bạn cũng thích",
                    style: AppTypography.mediumBlack,
                  ),
                  color: Colors.black.withOpacity(0.4),
                  thickness: 1,
                  size: 28.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: AutoHeightGridView(
                  itemCount: productsRecommend.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  builder: (context, index) {
                    // return SizedBox();
                    return Container(
                      decoration: BoxDecoration(color: AppColors.white),
                      child: ProductItem(
                          product: productsRecommend[index],
                          isShowIconRemove: false,
                          haveMargin: false),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
