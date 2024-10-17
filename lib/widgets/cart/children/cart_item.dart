import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/product/product_detail_model.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("cartItem: ${widget.cartItem?.toJson()}");
  }

  @override
  Widget build(BuildContext context) {
    String nameAttributeValue = widget
            .cartItem?.productDetail?.customAttributeValues
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
                value: true,
                onChanged: (v) {},
              ),
              CustomCachedNetworkImage(
                imageUrl: widget.cartItem?.productDetail.image ??
                    widget.cartItem?.productDetail.product?.image ??
                    'default_image_url',
                width: 100,
                height: 80,
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
                        Row(
                          children: [
                            Text(
                              "${widget.cartItem?.productDetail.price ?? ''}",
                              style: AppTypography.primaryRedBold,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "${widget.cartItem?.productDetail.price ?? ''}",
                              style: AppTypography.primaryLineThrough,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Row(
                          children: [
                            CustomButtonAction(
                              icon: Icons.remove,
                              onTap: () {
                                // if (_quantity > 1) {
                                //   setState(() {
                                //     _quantity--;
                                //   });
                                // }
                              },
                              isLeftRadius: true,
                            ),
                            Container(
                                constraints: BoxConstraints(
                                  minWidth: 30.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Center(
                                  child: Text(
                                    (widget.cartItem!.quantity ?? 1).toString(),
                                    style: AppTypography.mediumDarkBlueBold,
                                  ),
                                )),
                            CustomButtonAction(
                                icon: Icons.add,
                                onTap: () {
                                  // setState(() {
                                  //   _quantity++;
                                  // });
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
