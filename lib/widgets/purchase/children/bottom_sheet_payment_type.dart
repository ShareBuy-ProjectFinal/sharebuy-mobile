import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/cart_bloc/cart_event.dart';
import 'package:share_buy/blocs/home_bloc/home_event.dart';
import 'package:share_buy/enums/PayType.dart';

class BottomSheetPaymentType extends StatefulWidget {
  const BottomSheetPaymentType({super.key});

  @override
  State<BottomSheetPaymentType> createState() => _BottomSheetPaymentTypeState();
}

class _BottomSheetPaymentTypeState extends State<BottomSheetPaymentType> {
  List<String> types = ['MOMO', 'DIRECT'];
  @override
  Widget build(BuildContext context) {
    String value = context.read<CartBloc>().state.payType == PayType.momo
        ? 'MOMO'
        : 'DIRECT';
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      padding:
          EdgeInsets.only(left: 12.w, right: 12.w, top: 14.h, bottom: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Radio(
                  value: types[1],
                  groupValue: value,
                  onChanged: (v) {
                    // setState(() {
                    //   value = v!;
                    // });
                    Navigator.pop(context);
                    context.read<CartBloc>().state.payType = PayType.direct;
                    context.read<CartBloc>().add(EventReLoadScreen());
                  }),
              Expanded(
                child: Text(
                  'Thanh toán khi nhận hàng',
                  style: AppTypography.hintTextStyle,
                ),
              )
            ],
          ),
          Row(
            children: [
              Radio(
                  value: types[0],
                  groupValue: value,
                  onChanged: (v) {
                    // setState(() {
                    //   value = v!;
                    // });
                    Navigator.pop(context);
                    context.read<CartBloc>().state.payType = PayType.momo;
                    context.read<CartBloc>().add(EventReLoadScreen());
                  }),
              Expanded(
                child: Text(
                  'Thanh toán Momo',
                  style: AppTypography.hintTextStyle,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
