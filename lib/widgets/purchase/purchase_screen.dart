import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/widgets/purchase/children/tab_purchase.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  final List<String> listTitle = [
    'Chờ xác nhận',
    'Chờ lấy hàng',
    'Chờ giao hàng',
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
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
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
              buttonMargin: EdgeInsets.only(right: 4.w, bottom: 9.h),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
              controller: controller,
              onTap: (p0) {
                // setState(() {
                //   currentIndex = p0;
                // });
                // controller.animateTo(currentIndex);
              },
              tabs: listTitle.map((e) {
                return Tab(
                  text: e,
                );
              }).toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  TabPurchase(),
                  Container(
                    child: Text('Loc'),
                  ),
                  Container(
                    child: Text('Loc'),
                  ),
                  Container(
                    child: Text('Loc'),
                  ),
                  Container(
                    child: Text('Loc'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
