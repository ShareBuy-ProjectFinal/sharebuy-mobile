import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/home_bloc/home_bloc.dart';
import 'package:share_buy/blocs/home_bloc/home_state.dart';
import 'package:share_buy/models/product_model.dart';
import 'package:share_buy/widgets/component/product_item.dart';

class SaleProgramDetailScreen extends StatefulWidget {
  final String title;
  const SaleProgramDetailScreen({super.key, required this.title});

  @override
  State<SaleProgramDetailScreen> createState() =>
      _SaleProgramDetailScreenState();
}

class _SaleProgramDetailScreenState extends State<SaleProgramDetailScreen> {
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
          widget.title,
          style: AppTypography.headerAppbarStyle,
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/icon_search.png',
                width: 24.w,
                height: 24.h,
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Column(
            children: [
              Image.asset('assets/images/flash_sale_panel.png'),
              SizedBox(
                height: 12.h,
              ),
              Expanded(
                child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  return state.isLoading
                      ? const SizedBox()
                      : AutoHeightGridView(
                          itemCount: state.productRecommendsFlashSale.length,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 10.w,
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          builder: (context, index) {
                            // return SizedBox();
                            return ProductItem(
                                product:
                                    state.productRecommendsFlashSale[index],
                                isShowIconRemove: false,
                                haveMargin: false);
                          },
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
