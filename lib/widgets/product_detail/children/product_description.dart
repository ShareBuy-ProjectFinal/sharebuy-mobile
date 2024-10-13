import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/attribute/attribute_custom_model.dart';
import 'package:share_buy/models/product/product_model.dart';

class ProductDescription extends StatefulWidget {
  final ProductModel product;
  const ProductDescription({super.key, required this.product});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thông tin sản phẩm',
          style: AppTypography.primaryDarkBlueBold,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'Thuộc tính:',
          style: AppTypography.hintTextStyle,
        ),
        SizedBox(
          height: 3.h,
        ),
        ...List.generate(widget.product.customAttributes?.length ?? 0, (index) {
          CustomAttribute attribute = widget.product.customAttributes![index];
          return Text(
            '${attribute.attributeName}: ${attribute.customAttributeValues?.map((item) => item.value).join(', ') ?? ''}',
            style: AppTypography.hintTextStyle,
          );
        }),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Mô tả:',
          style: AppTypography.hintTextStyle,
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          widget.product.description ?? '',
          style: AppTypography.hintTextStyle,
        )
      ],
    );
  }
}
