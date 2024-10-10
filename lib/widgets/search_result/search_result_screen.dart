import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/home_bloc/home_bloc.dart';
import 'package:share_buy/blocs/home_bloc/home_state.dart';
import 'package:share_buy/widgets/component/custom_dropdown.dart';
import 'package:share_buy/widgets/component/product_item.dart';
import 'package:share_buy/widgets/search_result/children/top_search_bar.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '145 Result',
                  style: AppTypography.hintTextStyleBold,
                ),
                const CustomDropdown(
                    items: [],
                    title: 'Chọn danh mục',
                    titleTextColor: AppColors.textDartBlue),
              ],
            ),
            Expanded(
              child:
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                return state.isLoading
                    ? const SizedBox()
                    : AutoHeightGridView(
                        itemCount: state.products.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        builder: (context, index) {
                          return ProductItem(
                              product: state.products[index],
                              isShowIconRemove: false,
                              haveMargin: false);
                        },
                      );
              }),
            )
          ],
        ),
      )),
    );
  }
}
