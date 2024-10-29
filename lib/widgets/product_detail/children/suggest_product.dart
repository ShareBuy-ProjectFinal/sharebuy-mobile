import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/home_bloc/home_bloc.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';
import 'package:share_buy/models/product_model.dart';
import 'package:share_buy/widgets/component/product_item.dart';

class SuggestProduct extends StatefulWidget {
  const SuggestProduct({super.key});

  @override
  State<SuggestProduct> createState() => _SuggestProductState();
}

class _SuggestProductState extends State<SuggestProduct> {
  // List<ProductTestModel> products = [
  //   ProductTestModel(
  //       name: 'Giày',
  //       imageUrl: 'assets/images/shose_1.png',
  //       price: 299.43,
  //       salePrice: 534.33,
  //       saleOffPercent: 24),
  //   ProductTestModel(
  //       name: 'Giày',
  //       imageUrl: 'assets/images/shose_2.png',
  //       price: 299.43,
  //       salePrice: 534.33,
  //       saleOffPercent: 24),
  //   ProductTestModel(
  //       name: 'Túi xách',
  //       imageUrl: 'assets/images/bag_1.png',
  //       price: 299.43,
  //       salePrice: 534.33,
  //       saleOffPercent: 24),
  //   ProductTestModel(
  //       name: 'Túi xách',
  //       imageUrl: 'assets/images/bag_2.png',
  //       price: 299.43,
  //       salePrice: 534.33,
  //       saleOffPercent: 24),
  //   ProductTestModel(
  //       name: 'Giày',
  //       imageUrl: 'assets/images/shose_1.png',
  //       price: 299.43,
  //       salePrice: 534.33,
  //       saleOffPercent: 24),
  //   ProductTestModel(
  //       name: 'Giày',
  //       imageUrl: 'assets/images/shose_2.png',
  //       price: 299.43,
  //       salePrice: 534.33,
  //       saleOffPercent: 24),
  // ];
  @override
  Widget build(BuildContext context) {
    List<ProductRecommendModel> productsRecommend =
        context.read<HomeBloc>().state.products;
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
            children: productsRecommend.asMap().entries.map((element) {
              // return SizedBox();
              return ProductItem(
                product: productsRecommend[element.key],
                isShowIconRemove: false,
                haveMargin: true,
                isOnHorizontalList: true,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
