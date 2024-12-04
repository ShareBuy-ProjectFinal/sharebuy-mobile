import 'dart:developer';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/blocs/search_bloc/search_bloc.dart';
import 'package:share_buy/blocs/search_bloc/search_event.dart';
import 'package:share_buy/blocs/search_bloc/search_state.dart';
import 'package:share_buy/main.dart';
import 'package:share_buy/widgets/component/product_item.dart';
import 'package:share_buy/widgets/explore/children/men_caterogy.dart';
import 'package:share_buy/widgets/explore/children/women_caterogy.dart';
import 'package:share_buy/widgets/main/children/top_search_bar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 300 &&
          !context.read<SearchBloc>().state.isLoading) {
        context.read<SearchBloc>().add(EventLoadData(
            keyword: context.read<SearchBloc>().state.keyword,
            offset: context.read<SearchBloc>().state.offset));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.isLoadingOrverLay) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TopSearchBar(),
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
            BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
              return state.productRecommends.isEmpty
                  ? Column(
                      children: [
                        const MenCaterogy(),
                        SizedBox(
                          height: 12.h,
                        ),
                        const WomenCaterogy(),
                      ],
                    )
                  : Expanded(
                      child: AutoHeightGridView(
                        controller: scrollController,
                        itemCount: state.productRecommends.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        builder: (context, index) {
                          return ProductItem(
                              product: state.productRecommends[index],
                              isShowIconRemove: false,
                              haveMargin: false);
                        },
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
