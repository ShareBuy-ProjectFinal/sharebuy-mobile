import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tài khoản',
            style: AppTypography.headerAppbarStyle,
          ),
          SizedBox(
            height: 12.h,
          ),
          const Divider(
            height: 1,
            color: AppColors.borderTextfieldColor,
          ),
          SizedBox(
            height: 12.h,
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/avatar.png',
                  width: 120,
                  height: 120,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [Text('loc'), Text('loc'), Text('loc')],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          )
        ],
      ),
    );
  }
}
