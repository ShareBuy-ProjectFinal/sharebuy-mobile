import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/widgets/cart/children/botttom_sheeet_cart_item.dart';

class ChangeDetailItem extends StatefulWidget {
  final CartItemModel cartItem;
  const ChangeDetailItem({
    super.key,
    required this.cartItem,
  });

  @override
  State<ChangeDetailItem> createState() => _ChangeDetailItemState();
}

class _ChangeDetailItemState extends State<ChangeDetailItem> {
  void _resetProductSelected() {
    context.read<CartBloc>().add(EventResetProductSelected());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.read<CartBloc>().add(EventResetProductSelected());
        await showModalBottomSheet(
            context: context,
            builder: (context) {
              return BotttomSheeetCartItem(
                // quantity: widget.cartItem.quantity ?? 1,
                // productDetail: widget.cartItem.productDetail,
                cartItem: widget.cartItem,
              );
            });
      },
      child: Container(
        width: 100.w,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            color: AppColors.borderTextfieldColor,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.cartItem.productDetail.customAttributeValues
                        ?.getAttributeValuesName() ??
                    "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Icon(Icons.expand_more),
          ],
        ),
      ),
    );
  }
}
