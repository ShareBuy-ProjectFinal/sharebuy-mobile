import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/widgets/component/custom_textfield.dart';
import 'package:badges/badges.dart' as badges;
import 'package:share_buy/widgets/main/children/event_slider.dart';
import 'package:share_buy/widgets/main/children/product_category.dart';
import 'package:share_buy/widgets/main/children/top_search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 14.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TopSearchBar(),
            SizedBox(
              height: 12.h,
            ),
            const Divider(
              height: 1,
              color: AppColors.borderTextfieldColor,
            ),
            EventSlider(),
            SizedBox(
              height: 12.h,
            ),
            ProductCategory(),
          ],
        ),
      ),
    );
  }
}
