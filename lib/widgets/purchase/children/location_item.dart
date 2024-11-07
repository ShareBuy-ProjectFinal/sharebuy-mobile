import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/address_bloc/address_bloc.dart';
import 'package:share_buy/blocs/address_bloc/address_state.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/main.dart';
import 'package:share_buy/models/address/address_model.dart';
import 'package:share_buy/models/user/user_model.dart';

class LocationItem extends StatefulWidget {
  const LocationItem({super.key});

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  @override
  Widget build(BuildContext context) {
    // AddressModel? address = context.read<AddressBloc>().state.selectedAddress;
    return BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          log("LocationItem clicked");
          Navigator.pushNamed(context, NavigatorName.ADDRESS_SELECTION_SCREEN);
        },
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          // margin: EdgeInsets.only(top: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.pin_drop,
                  color: AppColors.buttonBlue,
                  size: 22,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Địa chỉ nhận hàng",
                        style: AppTypography.primaryDarkBlueBold,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      state.selectedAddress != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.selectedAddress?.userInfo?.fullName} | ${state.selectedAddress?.phoneNumber ?? ''}',
                                  style: AppTypography.primaryDarkBlueBold,
                                ),
                                Text(
                                  '${state.selectedAddress?.detail}',
                                  style: AppTypography.primaryDarkBlueBold,
                                ),
                                Text(
                                  '${state.selectedAddress?.ward?.wardName}, ${state.selectedAddress?.district?.districtName}, ${state.selectedAddress?.province?.provinceName}',
                                  style: AppTypography.primaryDarkBlueBold,
                                )
                              ],
                            )
                          : Text(
                              "Chưa có địa chỉ giao hàng",
                              style: AppTypography.primaryDarkBlueBold,
                            ),
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: AppColors.hintTextColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
