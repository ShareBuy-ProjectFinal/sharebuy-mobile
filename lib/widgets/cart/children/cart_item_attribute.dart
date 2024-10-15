import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_event.dart';
import 'package:share_buy/models/attribute/attribute_custom_model.dart';
import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';

class CartItemAttribute extends StatefulWidget {
  final CustomAttribute attribute;
  final dynamic attributeValueId;
  const CartItemAttribute(
      {super.key, required this.attribute, this.attributeValueId});

  @override
  State<CartItemAttribute> createState() => _CartItemAttributeState();
}

class _CartItemAttributeState extends State<CartItemAttribute> {
  int _indexSelected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.attribute.attributeName ?? '',
        ),
        SizedBox(
          height: 5.h,
        ),
        Wrap(
          children: List.generate(
              widget.attribute.customAttributeValues?.length ?? 0, (index) {
            CustomAttributeValue customAttributeValue =
                widget.attribute.customAttributeValues![index];
            customAttributeValue.customAttribute = CustomAttribute(
                id: widget.attribute.id,
                attributeName: widget.attribute.attributeName);
            if (widget.attributeValueId == customAttributeValue.id) {
              _indexSelected = index;
              log("indexSelected: $_indexSelected ${widget.attributeValueId}");
            }
            return GestureDetector(
              onTap: () {
                context.read<ProductBloc>().add(SelectAttributeValueEvent(
                    customAttributeValue: customAttributeValue));
                setState(() {
                  _indexSelected == index
                      ? _indexSelected = -1
                      : _indexSelected = index;
                });
              },
              child: IntrinsicWidth(
                child: Container(
                  margin: const EdgeInsets.only(right: 10, bottom: 10),
                  padding: EdgeInsets.symmetric(
                      horizontal: index == _indexSelected ? 4.w : 5.w),
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: index == _indexSelected
                            ? Colors.red.shade300
                            : Colors.black,
                        width: index == _indexSelected ? 2.w : 1.w),
                  ),
                  child: Center(
                    child: Text(
                      customAttributeValue.value ?? '',
                      style: AppTypography.smallDarkBlueBold,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        const Divider(),
      ],
    );
  }
}
