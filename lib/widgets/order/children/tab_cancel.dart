import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/order/children/ordered_item.dart';

class TabCancel extends StatefulWidget {
  const TabCancel({super.key});

  @override
  State<TabCancel> createState() => _TabCancelState();
}

class _TabCancelState extends State<TabCancel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.backgroundGrey),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Column(
                children: [
                  OrderedItem(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomButton(
                        buttonColor: AppColors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        buttonText: 'Xem chi tiết đơn huỷ',
                        onTap: () {
                          log('See order detail tab cancel');
                        },
                        textColor: AppColors.textBlack,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      CustomButton(
                        buttonColor: AppColors.white,
                        textColor: AppColors.buttonBlue,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        buttonText: 'Mua lại',
                        onTap: () {
                          log('onTap Buy again tab cancel');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
