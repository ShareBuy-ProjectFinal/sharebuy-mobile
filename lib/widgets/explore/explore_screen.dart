import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/widgets/explore/children/men_caterogy.dart';
import 'package:share_buy/widgets/explore/children/women_caterogy.dart';
import 'package:share_buy/widgets/main/children/top_search_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopSearchBar(),
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
          MenCaterogy(),
          SizedBox(
            height: 12.h,
          ),
          WomenCaterogy(),
        ],
      ),
    );
  }
}
