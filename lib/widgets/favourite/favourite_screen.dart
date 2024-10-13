import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/product_model.dart';
import 'package:share_buy/widgets/component/product_item.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({
    super.key,
  });

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<ProductTestModel> products = [
    ProductTestModel(
        name: 'Giày',
        imageUrl: 'assets/images/shose_1.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
    ProductTestModel(
        name: 'Giày',
        imageUrl: 'assets/images/shose_2.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
    ProductTestModel(
        name: 'Túi xách',
        imageUrl: 'assets/images/bag_1.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
    ProductTestModel(
        name: 'Túi xách',
        imageUrl: 'assets/images/bag_2.png',
        price: 299.43,
        salePrice: 534.33,
        saleOffPercent: 24),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(
            'assets/icons/icon_back.png',
            width: 24.w,
            height: 24.h,
          ),
        ),
        title: Text(
          'Sản phẩm yêu thích',
          style: AppTypography.headerAppbarStyle,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: AutoHeightGridView(
            itemCount: products.length,
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            builder: (context, index) {
              return SizedBox();
              // return ProductItem(
              //     product: products[index],
              //     isShowIconRemove: true,
              //     haveMargin: false);
            },
          ),
        ),
      ),
    );
  }
}
