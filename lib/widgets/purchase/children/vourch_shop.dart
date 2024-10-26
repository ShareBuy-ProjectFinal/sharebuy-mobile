import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class VourchShop extends StatefulWidget {
  const VourchShop({super.key});

  @override
  State<VourchShop> createState() => _VourchShopState();
}

class _VourchShopState extends State<VourchShop> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal:
                  BorderSide(color: AppColors.backgroundGrey, width: 1.h)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.card_giftcard,
                  color: AppColors.buttonBlue,
                  size: 20.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Vourcher shop',
                  style: AppTypography.primaryDarkBlueBold,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Chọn hoặc nhập mã',
                  style: AppTypography.primaryHintText,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.backgroundGrey,
                  size: 16.w,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
