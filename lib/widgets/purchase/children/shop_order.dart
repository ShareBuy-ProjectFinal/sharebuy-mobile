import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class ShopOrder extends StatefulWidget {
  const ShopOrder({super.key});

  @override
  State<ShopOrder> createState() => _ShopOrderState();
}

class _ShopOrderState extends State<ShopOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shop Lê Hữu Hiệp',
              style: AppTypography.primaryDarkBlueBold,
            ),
            Text(
              'Chờ thanh toán',
              style: AppTypography.primaryBlueBold,
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Image.asset(
                  'assets/images/bag_1.png',
                  width: 90.w,
                  height: 90.h,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'T-Shirt',
                      style: AppTypography.primaryDarkBlueBold,
                    ),
                    Text(
                      'T-Shirt',
                      style: AppTypography.hintTextStyle,
                    ),
                    Text(
                      'T-Shirt',
                      style: AppTypography.hintTextStyleBold,
                    ),
                  ],
                )
              ],
            );
          },
          itemCount: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Tổng số tiền: 100.000đ',
              style: AppTypography.hintTextStyleBold,
            )
          ],
        )
      ],
    );
  }
}
