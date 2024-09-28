import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/models/product_model.dart';
import 'package:share_buy/widgets/component/product_item.dart';

class RecommendProducts extends StatefulWidget {
  const RecommendProducts({super.key});

  @override
  State<RecommendProducts> createState() => _RecommendProductsState();
}

class _RecommendProductsState extends State<RecommendProducts> {
  List<ProductModel> products = [
    ProductModel(
        name: 'Giày',
        imageUrl: 'assets/images/shose_1.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
    ProductModel(
        name: 'Giày',
        imageUrl: 'assets/images/shose_2.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
    ProductModel(
        name: 'Túi xách',
        imageUrl: 'assets/images/bag_1.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
    ProductModel(
        name: 'Túi xách',
        imageUrl: 'assets/images/bag_2.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
    ProductModel(
        name: 'Giày',
        imageUrl: 'assets/images/shose_1.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
    ProductModel(
        name: 'Giày',
        imageUrl: 'assets/images/shose_2.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
  ];
  @override
  Widget build(BuildContext context) {
    return AutoHeightGridView(
      itemCount: products.length,
      crossAxisCount: 2,
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 10.w,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      builder: (context, index) {
        return ProductItem(
            product: products[index],
            isShowIconRemove: false,
            haveMargin: false);
      },
    );
  }
}
