import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/blocs/home_bloc/home_bloc.dart';
import 'package:share_buy/blocs/home_bloc/home_event.dart';
import 'package:share_buy/blocs/home_bloc/home_state.dart';
import 'package:share_buy/widgets/component/product_item.dart';

class RecommendProducts extends StatefulWidget {
  const RecommendProducts({super.key});

  @override
  State<RecommendProducts> createState() => _RecommendProductsState();
}

class _RecommendProductsState extends State<RecommendProducts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(EventLoadingRecommendUser());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return state.isLoading
          ? const SizedBox()
          : AutoHeightGridView(
              itemCount: state.productRecommendsUser.length,
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              builder: (context, index) {
                return ProductItem(
                    product: state.productRecommendsUser[index],
                    isShowIconRemove: false,
                    haveMargin: false);
              },
            );
    });
  }
}
