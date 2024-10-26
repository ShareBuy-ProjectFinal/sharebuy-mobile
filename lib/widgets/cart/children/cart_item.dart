import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/product/product_detail_model.dart';
import 'package:share_buy/utils/format.dart';
import 'package:share_buy/widgets/cart/children/change_detail_item.dart';
import 'package:share_buy/widgets/component/CustomCachedNetworkImage.dart';
import 'package:share_buy/widgets/component/custom_button_action.dart';

class CartItem extends StatefulWidget {
  CartItemModel? cartItem;
  CartItem({super.key, CartItemModel? cartItem})
      : cartItem = cartItem ??
            CartItemModel(productDetail: ProductDetailModel(quantity: 1));

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quantityController.text = (widget.cartItem?.quantity ?? 1).toString();
  }

  @override
  Widget build(BuildContext context) {
    String nameAttributeValue = widget
            .cartItem?.productDetail.customAttributeValues
            ?.map((e) => e.value)
            .join(', ') ??
        '';

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Checkbox(
                value: widget.cartItem?.isSelected ?? false,
                onChanged: (v) {
                  context.read<CartBloc>().add(EventSelectItemCartCheckbox(
                      itemId: widget.cartItem?.id ?? '',
                      value: v!,
                      type: TypeCheckBox.item));
                },
              ),
              CustomCachedNetworkImage(
                imageUrl: widget.cartItem?.productDetail.image ??
                    widget.cartItem?.productDetail.product?.image ??
                    'default_image_url',
                width: 100,
                height: 100,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartItem?.productDetail.name ?? 'Product name',
                      style: AppTypography.primaryDarkBlueBold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    ChangeDetailItem(
                      productDetailId: 'productDetailId',
                      nameAttributeValue: nameAttributeValue,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                Format.formatNumber(
                                    widget.cartItem?.productDetail.price ?? 0),
                                style: AppTypography.primaryRedBold,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: Text(
                                  Format.formatNumber(
                                      widget.cartItem?.productDetail.price ??
                                          0),
                                  style: AppTypography.mediumLineThrough,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Row(
                          children: [
                            CustomButtonAction(
                              icon: Icons.remove,
                              isDisable: (widget.cartItem?.quantity ?? 1) == 1,
                              onTap: () {
                                if ((widget.cartItem?.quantity ?? 1) > 1) {
                                  context.read<CartBloc>().add(
                                      UpdateQuantityCartItemEvent(
                                          cartItemId: widget.cartItem?.id ?? '',
                                          quantity: (widget.cartItem?.quantity
                                                      ?.toInt() ??
                                                  1) -
                                              1));
                                  _quantityController.text =
                                      ((widget.cartItem?.quantity?.toInt() ??
                                                  1) -
                                              1)
                                          .toString();
                                }
                              },
                              isLeftRadius: true,
                            ),
                            Container(
                                constraints: BoxConstraints(
                                  minWidth: 30.w,
                                ),
                                width: 35.w,
                                // height: 19.h,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: TextField(
                                  controller: _quantityController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isCollapsed: true),
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: AppTypography.mediumDarkBlueBold,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      context.read<CartBloc>().add(
                                          UpdateQuantityCartItemEvent(
                                              cartItemId:
                                                  widget.cartItem?.id ?? '',
                                              quantity: int.parse(value)));
                                    }
                                  },
                                )),
                            CustomButtonAction(
                                icon: Icons.add,
                                onTap: () {
                                  context.read<CartBloc>().add(
                                      UpdateQuantityCartItemEvent(
                                          cartItemId: widget.cartItem?.id ?? '',
                                          quantity: (widget.cartItem?.quantity
                                                      ?.toInt() ??
                                                  1) +
                                              1));
                                  _quantityController.text =
                                      ((widget.cartItem?.quantity?.toInt() ??
                                                  1) +
                                              1)
                                          .toString();
                                }),
                            SizedBox(
                              width: 8.w,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
