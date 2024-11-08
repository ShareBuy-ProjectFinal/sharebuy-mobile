import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/home_bloc/home_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_event.dart';
import 'package:share_buy/blocs/product_bloc/product_state.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';
import 'package:share_buy/models/product_model.dart';
import 'package:share_buy/widgets/component/product_item.dart';

class SuggestProduct extends StatefulWidget {
  final String productId;
  SuggestProduct({super.key, required this.productId});

  @override
  State<SuggestProduct> createState() => _SuggestProductState();
}

class _SuggestProductState extends State<SuggestProduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<ProductBloc>()
        .add(EventLoadingRecommendProduct(productId: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Có lẽ bạn cũng thích',
            style: AppTypography.primaryDarkBlueBold,
          ),
          SizedBox(
            height: 12.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: state.productRecommends.asMap().entries.map((element) {
                // return SizedBox();
                return ProductItem(
                  product: element.value,
                  isShowIconRemove: false,
                  haveMargin: true,
                  isOnHorizontalList: true,
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}
