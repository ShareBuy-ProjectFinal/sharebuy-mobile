import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_event.dart';
import 'package:share_buy/blocs/product_bloc/product_state.dart';
import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/product/product_detail_model.dart';
import 'package:share_buy/models/product/product_model.dart';
import 'package:share_buy/widgets/cart/children/cart_item_attribute.dart';
import 'package:share_buy/widgets/component/CustomCachedNetworkImage.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/custom_button_action.dart';

class BottomSheetItem extends StatefulWidget {
  final String? productId; //productId
  const BottomSheetItem({super.key, this.productId});

  @override
  State<BottomSheetItem> createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.productId != null) {
      context
          .read<ProductBloc>()
          .add(ProductLoadingEvent(id: widget.productId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductModel product = context.read<ProductBloc>().state.product;
    ProductDetailModel productDetail = ProductDetailModel();
    bool isDisable = true;

    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      List<CustomAttributeValue> selectedAttributeValues =
          state.selectedAttributeValues;
      if (selectedAttributeValues.length == product.customAttributes!.length) {
        product.productDetails?.forEach((element) {
          bool allAttributesMatch =
              element.customAttributeValues?.every((attributeValue) {
                    return selectedAttributeValues.contains(attributeValue);
                  }) ??
                  false;
          if (allAttributesMatch) {
            productDetail = element;
            isDisable = false;
          }
        });
      } else {
        isDisable = true;
      }
      return Container(
        color: AppColors.white,
        padding: EdgeInsets.all(15.w),
        margin: EdgeInsets.only(bottom: 10.h),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: CustomCachedNetworkImage(
                      imageUrl:
                          isDisable ? product.image! : productDetail.image!,
                      fallbackImageUrl: product.image,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            product.oldPrice.toString(),
                            style: AppTypography.largeLineThrough,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            product.price.toString(),
                            style: AppTypography.primaryRedBold,
                          ),
                        ],
                      ),
                      Text(
                          'Kho: ${isDisable ? product.quantity.toString() : productDetail.quantity.toString()}'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            const Divider(
              color: AppColors.borderTextfieldColor,
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: product.customAttributes?.length ?? 0,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => SizedBox(
                  height: 0.h,
                ),
                itemBuilder: (context, index) {
                  int indexFind = selectedAttributeValues.indexWhere(
                      (element) =>
                          element.customAttribute!.id ==
                          product.customAttributes![index].id);
                  return CartItemAttribute(
                    attribute: product.customAttributes![index],
                    attributeValueId: indexFind == -1
                        ? ''
                        : selectedAttributeValues[indexFind].id,
                  );
                },
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Số lượng',
                  style: AppTypography.primaryDarkBlueBold,
                ),
                Row(
                  children: [
                    CustomButtonAction(
                      isDisable: isDisable,
                      icon: Icons.remove,
                      onTap: () {
                        if (state.quantity > 1) {
                          context.read<ProductBloc>().add(ChangeQuantityEvent(
                              quantity: state.quantity - 1));
                        }
                      },
                      isLeftRadius: true,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        constraints: BoxConstraints(
                          minWidth: 30.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: isDisable ? Colors.grey : Colors.black),
                        ),
                        child: Container(
                          height: 18.h,
                          // width: 15.w,
                          constraints: BoxConstraints(
                            minWidth: 18.w,
                          ),
                          child: Center(
                            child: Text(
                              (state.quantity).toString(),
                              style: isDisable
                                  ? AppTypography.primaryDarkBlueBoldDisable
                                  : AppTypography.primaryDarkBlueBold,
                            ),
                          ),
                        )),
                    CustomButtonAction(
                      isDisable: isDisable,
                      icon: Icons.add,
                      onTap: () {
                        if (state.quantity < product.quantity!) {
                          context.read<ProductBloc>().add(ChangeQuantityEvent(
                              quantity: state.quantity + 1));
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
                disable: isDisable,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                buttonColor: AppColors.buttonBlue,
                buttonText: 'Thêm vào giỏ hàng',
                onTap: () {
                  context.read<ProductBloc>().add(AddCartItemEvent(
                      productDetailId: productDetail.id!,
                      quantity: state.quantity));
                },
                textColor: Colors.white),
          ],
        ),
      );
    });
  }
}
