import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/blocs/order_bloc/order_bloc.dart';
import 'package:share_buy/blocs/order_bloc/order_event.dart';
import 'package:share_buy/blocs/order_bloc/order_state.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/order/children/ordered_item.dart';

class TabToShip extends StatefulWidget {
  const TabToShip({super.key});

  @override
  State<TabToShip> createState() => _TabToShipState();
}

class _TabToShipState extends State<TabToShip> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OrderBloc>().add(EventLoadingOrderToDelivery());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (BuildContext context, OrderState state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
        return Container(
          decoration: BoxDecoration(color: AppColors.backgroundGrey),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            itemCount: state.ordersToDeliver.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Column(
                    children: [
                      OrderedItem(
                        typeOrdered: OrderedItemType.toShip,
                        order: state.ordersToDeliver[index],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomButton(
                            buttonColor: AppColors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            buttonText: 'Xem chi tiết',
                            onTap: () {
                              log('See order detail tab cancel');
                            },
                            textColor: AppColors.textBlack,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
