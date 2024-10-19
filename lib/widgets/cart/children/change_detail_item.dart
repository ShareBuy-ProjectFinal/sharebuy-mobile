import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';

class ChangeDetailItem extends StatefulWidget {
  final String productDetailId;
  final String nameAttributeValue;
  const ChangeDetailItem(
      {super.key,
      required this.productDetailId,
      required this.nameAttributeValue});

  @override
  State<ChangeDetailItem> createState() => _ChangeDetailItemState();
}

class _ChangeDetailItemState extends State<ChangeDetailItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.read<CartBloc>().add(ChangeAttributeCartItemEvent(
        //     productDetailId: widget.productDetailId));
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
                widget.nameAttributeValue,
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
