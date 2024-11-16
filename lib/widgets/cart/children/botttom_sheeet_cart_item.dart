import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/blocs/cart_bloc/cart_state.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_event.dart';
import 'package:share_buy/blocs/product_bloc/product_state.dart';
import 'package:share_buy/models/attribute/attribute_custom_value_model.dart';
import 'package:share_buy/models/cart/cart_item_model.dart';
import 'package:share_buy/models/product/product_detail_model.dart';
import 'package:share_buy/widgets/cart/children/cart_item_attribute.dart';
import 'package:share_buy/widgets/component/CustomCachedNetworkImage.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/custom_button_action.dart';

class BotttomSheeetCartItem extends StatefulWidget {
  // final ProductDetailModel productDetail;
  // final num quantity;
  final CartItemModel cartItem;

  BotttomSheeetCartItem(
      {super.key,
      // required this.productDetail,
      // required this.quantity
      required this.cartItem});

  @override
  State<BotttomSheeetCartItem> createState() => _BotttomSheeetCartItemState();
}

class _BotttomSheeetCartItemState extends State<BotttomSheeetCartItem> {
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CartBloc>().add(EventChangeQuantityProductSelected(
        quantity: widget.cartItem.quantity!.toInt()));
    context.read<CartBloc>().add(EventLoadingProductSelected(
        id: widget.cartItem.productDetail.product?.id ?? ""));
    context.read<CartBloc>().add(EventProductSelectAttributeValues(
        customAttributeValues:
            widget.cartItem.productDetail.customAttributeValues ?? []));
    _quantityController.text = (widget.cartItem.quantity ?? 1).toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (BuildContext context, CartState state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
          if (state.isUpdateCartItem) {
            context.read<CartBloc>().add(EventResetProductSelected());
            Navigator.pop(context);
          }
        }
      },
      child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        ProductDetailModel productDetail = ProductDetailModel();
        bool isDisable = true;
        _quantityController.text = state.quantity.toString();

        List<CustomAttributeValue> selectedAttributeValues =
            state.selectedAttributeValues;
        if (selectedAttributeValues.length ==
            state.product.customAttributes!.length) {
          state.product.productDetails?.forEach((element) {
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
                        imageUrl: isDisable
                            ? state.product.image!
                            : productDetail.image!,
                        fallbackImageUrl: state.product.image,
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
                              state.product.oldPrice.toString(),
                              style: AppTypography.largeLineThrough,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              state.product.price.toString(),
                              style: AppTypography.primaryRedBold,
                            ),
                          ],
                        ),
                        Text(
                            'Kho: ${isDisable ? state.product.quantity.toString() : productDetail.quantity.toString()}'),
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
                  itemCount: state.product.customAttributes?.length ?? 0,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 0.h,
                  ),
                  itemBuilder: (context, index) {
                    int indexFind = selectedAttributeValues.indexWhere(
                        (element) =>
                            element.customAttribute!.id ==
                            state.product.customAttributes![index].id);
                    return CartItemAttribute(
                      attribute: state.product.customAttributes![index],
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
                        icon: Icons.remove,
                        isDisable: state.quantity == 1,
                        onTap: () {
                          if (state.quantity > 1) {
                            context.read<CartBloc>().add(
                                EventChangeQuantityProductSelected(
                                    quantity: state.quantity - 1));
                            _quantityController.text =
                                (state.quantity - 1).toString();
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
                            border: Border.all(
                                color: isDisable ? Colors.grey : Colors.black),
                          ),
                          child: TextField(
                            controller: _quantityController,
                            decoration: const InputDecoration(
                                border: InputBorder.none, isCollapsed: true),
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            style: isDisable
                                ? AppTypography.mediumDarkBlueBoldDisable
                                : AppTypography.mediumDarkBlueBold,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                context.read<CartBloc>().add(
                                    EventChangeQuantityProductSelected(
                                        quantity: int.parse(value)));
                              }
                            },
                          )),
                      CustomButtonAction(
                        isDisable: isDisable ||
                            state.quantity == state.product.quantity,
                        icon: Icons.add,
                        onTap: () {
                          if (state.quantity < state.product.quantity!) {
                            _quantityController.text =
                                (state.quantity + 1).toString();
                            context.read<CartBloc>().add(
                                EventChangeQuantityProductSelected(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  buttonColor: AppColors.buttonBlue,
                  buttonText: 'Thêm vào giỏ hàng',
                  onTap: () {
                    context.read<CartBloc>().add(UpdateQuantityCartItemEvent(
                        isBottomSheet: true,
                        cartItemId: widget.cartItem.id ?? '',
                        quantity: state
                            .quantity)); // (widget.cartItem?.quantity?.toInt() ?? 1) +
                  },
                  textColor: Colors.white),
            ],
          ),
        );
      }),
    );
  }
}
