import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/product_model.dart';
import 'package:share_buy/widgets/component/product_item.dart';

class SaleProgram extends StatefulWidget {
  final String title;
  const SaleProgram({super.key, required this.title});

  @override
  State<SaleProgram> createState() => _SaleProgramState();
}

class _SaleProgramState extends State<SaleProgram> {
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppTypography.primaryDarkBlueBold,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                    NavigatorName.SALE_PROGRAM_SCREEN,
                    arguments: {'title': widget.title});
              },
              child: Text(
                'Xem thêm',
                style: AppTypography.primaryBlueBold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: products.asMap().entries.map((element) {
              return ProductItem(
                product: products[element.key],
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
