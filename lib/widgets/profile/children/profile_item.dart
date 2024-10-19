// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class ProfileItem extends StatefulWidget {
  final String iconUrl;
  final String title;
  VoidCallback onTap;
  ProfileItem({
    super.key,
    required this.iconUrl,
    required this.title,
    required this.onTap,
  });

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(widget.iconUrl, width: 24.w, height: 24.h),
                SizedBox(
                  width: 12.0.w,
                ),
                Text(
                  widget.title,
                  style: AppTypography.primaryDarkBlueBold,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
