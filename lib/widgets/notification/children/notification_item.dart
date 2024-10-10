import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({super.key});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icons/icon_tag.png',
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(
            width: 12.w,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tiêu đề hay nhất',
                  style: AppTypography.headerAppbarStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Mặt hàng tốt nhất đã có mặt trên Sharebuy, hãy nhấp vào đây.',
                  style: AppTypography.hintTextStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'April 30, 2014 1:01 PM',
                  style: AppTypography.hintTextStyleBold,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
