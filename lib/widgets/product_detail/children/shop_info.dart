import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_state.dart';
import 'package:share_buy/models/shop/shop_model.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/component/custom_button_action.dart';

// ignore: must_be_immutable
class ShopInfo extends StatefulWidget {
  ShopModel? shop;
  ShopInfo({super.key, ShopModel? shop}) : shop = shop ?? ShopModel();

  @override
  State<ShopInfo> createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return Column(
        children: [
          Divider(),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundImage: CachedNetworkImageProvider(
                        widget.shop?.image ?? '',
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // '${'widget.shop?.fullName'}',
                            '${widget.shop?.fullName}',
                            style: AppTypography.primaryDarkBlueBold,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            'Online 3 phút trước',
                            style: AppTypography.hintTextStyleBold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomButton(
                buttonText: 'Xem Shop',
                buttonColor: Colors.white,
                textColor: Colors.red.shade400,
                borderColor: Colors.red.shade400,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text('88 ', style: AppTypography.mediumRedBold),
              Text('sản phẩm', style: AppTypography.mediumDarkBlueBold),
              SizedBox(
                width: 8.w,
              ),
              Text('${state.product.averageRating?.toStringAsFixed(2)} ',
                  style: AppTypography.mediumRedBold),
              Text('đánh giá', style: AppTypography.mediumDarkBlueBold),
              SizedBox(
                width: 8.w,
              ),
              Text('97% ', style: AppTypography.mediumRedBold),
              Text('phản hồi', style: AppTypography.mediumDarkBlueBold),
            ],
          ),
          Divider()
        ],
      );
    });
  }
}
