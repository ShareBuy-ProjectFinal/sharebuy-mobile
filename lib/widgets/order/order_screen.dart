import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/widgets/order/children/tab_cancel.dart';
import 'package:share_buy/widgets/order/children/tab_completed.dart';
import 'package:share_buy/widgets/order/children/tab_preparing.dart';
import 'package:share_buy/widgets/order/children/tab_return.dart';
import 'package:share_buy/widgets/order/children/tab_to_pay.dart';
import 'package:share_buy/widgets/order/children/tab_to_ship.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final List<String> listTitle = [
    'Chờ thanh toán',
    "Đang chuẩn bị",
    'Chờ giao hàng',
    'Trả hàng',
    'Đã nhận',
    'Đã hủy'
  ];
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: listTitle.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Text(
          'Đặt hàng',
          style: AppTypography.headerAppbarStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Column(
          children: [
            ButtonsTabBar(
              duration: 300,
              labelStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
              unselectedLabelStyle: TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
              unselectedDecoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.w),
                      topRight: Radius.circular(8.w))),
              decoration: BoxDecoration(
                color: AppColors.buttonBlue,
                border: Border(
                    bottom:
                        BorderSide(color: AppColors.buttonBlue, width: 12.w)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.w),
                    topRight: Radius.circular(8.w)),
              ),
              buttonMargin: EdgeInsets.only(
                right: 4.w,
                left: 4.w,
                bottom: 0.h,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
              controller: controller,
              onTap: (p0) {
                // setState(() {
                //   currentIndex = p0;
                // });
                // controller.animateTo(currentIndex);
              },
              tabs: listTitle.map((title) {
                return Tab(
                  text: title,
                );
              }).toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  TabToPay(),
                  TabPreparing(),
                  TabToShip(),
                  TabReturn(),
                  TabCompleted(),
                  TabCancel(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
