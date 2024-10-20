import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/widgets/component/custom_button.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: AppColors.hintTextColor),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Địa chỉ nhận hàng',
                          style: AppTypography.headerAppbarStyle,
                        ),
                        Text(
                          'Thay đổi',
                          style: AppTypography.headerAppbarStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(
                    'Tổng cộng',
                    style: AppTypography.hintTextStyleBold,
                  ),
                  Text(
                    '1.000.000đ',
                    style: AppTypography.largeRedBold,
                  )
                ]),
                SizedBox(
                  width: 5.w,
                ),
                CustomButton(
                  buttonColor: Colors.orange.shade900,
                  buttonText: "Đặt hàng",
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
                  onTap: () {},
                  textColor: Colors.white,
                  fontSize: 18.sp,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
