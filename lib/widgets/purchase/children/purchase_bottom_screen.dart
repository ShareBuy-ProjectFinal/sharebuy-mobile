import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_state.dart';
import 'package:share_buy/models/cart/cart_model.dart';
import 'package:share_buy/repositories/cart_repository.dart';
import 'package:share_buy/utils/format.dart';

class PurchaseBottomScreen extends StatefulWidget {
  const PurchaseBottomScreen({super.key});

  @override
  State<PurchaseBottomScreen> createState() => _PurchaseBottomScreenState();
}

class _PurchaseBottomScreenState extends State<PurchaseBottomScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      num total = state.carts.totalSelected();
      num totalShipping = state.carts.getCartItemSelected().length * 32000;
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                log("Vourcher app clicked");
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: 15.w, right: 10.w, bottom: 2.h, top: 2.h),
                // padding: EdgeInsets.only(left: 15.w, right: 10.w),
                child: Row(
                  children: [
                    Text(
                      'Vourcher app',
                      style: AppTypography.primaryBlack,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Text(
                        'Chọn hoặc nhập mã',
                        style: AppTypography.primaryHintText,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColors.hintTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                log("Shipping fee clicked");
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: 15.w, right: 10.w, bottom: 2.h, top: 2.h),
                child: Row(
                  children: [
                    Text(
                      'Phương thức thanh toán',
                      style: AppTypography.primaryBlack,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Text(
                        'Thanh toán khi nhận hàng',
                        style: AppTypography.primaryDarkBlue,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColors.hintTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              // padding: EdgeInsets.symmetric(horizontal: 15.w),
              padding: EdgeInsets.only(
                  left: 15.w, right: 15.w, bottom: 2.h, top: 2.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.receipt_long,
                        color: AppColors.yellow,
                        size: 22.sp,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Chi tiết hoá đơn',
                        style: AppTypography.largeBlack,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tổng tiền hàng',
                        style: AppTypography.primaryBlack,
                      ),
                      Expanded(
                        child: Text(
                          "${Format.formatNumber(total)} vnđ",
                          style: AppTypography.primaryBlack,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tổng phí vận chuyển',
                        style: AppTypography.primaryBlack,
                      ),
                      Expanded(
                        child: Text(
                          "${Format.formatNumber(totalShipping)} vnđ",
                          style: AppTypography.primaryBlack,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tổng thanh toán',
                        style: AppTypography.primaryBlack,
                      ),
                      Expanded(
                        child: Text(
                          "${Format.formatNumber(total + totalShipping)} vnđ",
                          style: AppTypography.primaryBlack,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
