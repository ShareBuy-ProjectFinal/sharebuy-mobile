import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_event.dart';
import 'package:share_buy/widgets/main/children/event_slider.dart';
import 'package:share_buy/widgets/main/children/recommend_products.dart';
import 'package:share_buy/widgets/main/children/sale_program.dart';
import 'package:share_buy/widgets/main/children/product_category.dart';
import 'package:share_buy/widgets/main/children/top_search_bar.dart';
import 'package:share_buy/widgets/product_detail/product_detail_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 14.h,
      ),
      child: Column(
        children: [
          TopSearchBar(),
          SizedBox(
            height: 12.h,
          ),
          const Divider(
            height: 1,
            color: AppColors.borderTextfieldColor,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  EventSlider(),
                  SizedBox(
                    height: 12.h,
                  ),
                  ProductCategory(),
                  SizedBox(
                    height: 28.h,
                  ),
                  SaleProgram(
                    title: 'Flash Sale',
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  // SaleProgram(
                  //   title: 'Mega Sale',
                  // ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Image.asset('assets/images/recommend_panel.png'),
                  RecommendProducts()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
