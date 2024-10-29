// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:share_buy/application/theme/app_typography.dart';

class BottomNavBar extends StatefulWidget {
  int index;
  final PageController pageController;
  BottomNavBar({super.key, required this.pageController, required this.index});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
      decoration: const BoxDecoration(
          border: Border(
              top:
                  BorderSide(color: AppColors.borderTextfieldColor, width: 1))),
      child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              widget.index = value;
              widget.pageController.jumpToPage(widget.index);
            });
          },
          backgroundColor: Colors.white,
          currentIndex: widget.index,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.buttonBlue,
          unselectedItemColor: AppColors.hintTextColor,
          elevation: 0,
          selectedFontSize: 12.sp,
          unselectedFontSize: 12.sp,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icon_home.png',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.hintTextColor,
                ),
                activeIcon: Image.asset(
                  'assets/icons/icon_home.png',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.buttonBlue,
                ),
                label: 'Trang chủ'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icon_search.png',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.hintTextColor,
                ),
                activeIcon: Image.asset(
                  'assets/icons/icon_search.png',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.buttonBlue,
                ),
                label: 'Tìm kiếm'),
            BottomNavigationBarItem(
                icon: badges.Badge(
                  badgeStyle: badges.BadgeStyle(badgeColor: AppColors.redLight),
                  badgeContent: Text(
                    '3',
                    style: AppTypography.mediumWhiteBold,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_cart.png',
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.hintTextColor,
                  ),
                ),
                activeIcon: badges.Badge(
                  badgeContent: Text(
                    '3',
                    style: AppTypography.mediumWhiteBold,
                  ),
                  child: Image.asset(
                    'assets/icons/icon_cart.png',
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.buttonBlue,
                  ),
                ),
                label: 'Giỏ hàng'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icon_offer.png',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.hintTextColor,
                ),
                activeIcon: Image.asset(
                  'assets/icons/icon_offer.png',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.buttonBlue,
                ),
                label: 'Đơn hàng'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icon_account.png',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.hintTextColor,
                ),
                activeIcon: Image.asset(
                  'assets/icons/icon_account.png',
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.buttonBlue,
                ),
                label: 'Tài khoản')
          ]),
    );
  }
}
