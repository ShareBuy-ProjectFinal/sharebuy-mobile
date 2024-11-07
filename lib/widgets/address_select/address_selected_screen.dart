import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/address_bloc/address_bloc.dart';
import 'package:share_buy/blocs/address_bloc/address_event.dart';
import 'package:share_buy/blocs/address_bloc/address_state.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';

class AddressSelected extends StatefulWidget {
  const AddressSelected({super.key});

  @override
  State<AddressSelected> createState() => _AddressSelectedState();
}

class _AddressSelectedState extends State<AddressSelected> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AddressBloc>().add(EventLoadingAddress());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (BuildContext context, AddressState state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          title: Text('Chọn địa chỉ nhận hàng',
              style: AppTypography.headerAppbarStyle),
        ),
        body: SafeArea(child:
            BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
          String valueRadio = state.selectedAddress?.id ?? '';
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      decoration:
                          BoxDecoration(color: AppColors.backgroundGrey),
                      child: Text(
                        'Địa chỉ',
                        style: AppTypography.primaryBlack,
                      ),
                    ),
                    ListView.separated(
                      itemCount: state.addresses.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                        height: 5.h,
                      ),
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 10.h),
                        child: Row(
                          children: [
                            Radio(
                                value: state.addresses[index].id,
                                groupValue: state.selectedAddress?.id,
                                onChanged: (value) {
                                  context.read<AddressBloc>().add(
                                      EventSelectAddress(
                                          state.addresses[index]));
                                  Navigator.pop(context);
                                }),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${state.addresses[index].userInfo?.fullName} | ${state.addresses[index].phoneNumber ?? ''}',
                                  style: AppTypography.primaryDarkBlueBold,
                                ),
                                Text(
                                  '${state.addresses[index].detail}',
                                  style: AppTypography.primaryDarkBlueBold,
                                ),
                                Text(
                                  '${state.addresses[index].ward?.wardName}, ${state.addresses[index].district?.districtName}, ${state.addresses[index].province?.provinceName}',
                                  style: AppTypography.primaryDarkBlueBold,
                                ),
                                AuthBloc.currentUser?.address?.id ==
                                        state.addresses[index].id
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        margin: EdgeInsets.only(top: 5.h),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.buttonBlue)),
                                        child: Text(
                                          'Mặc định',
                                          style: AppTypography.primaryBlue,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, NavigatorName.ADDRESS_FORM_SCREEN);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: BoxDecoration(color: AppColors.backgroundGrey),
                  child: Text(
                    'Thêm địa chỉ mới',
                    style: AppTypography.primaryBlack,
                  ),
                ),
              )
            ],
          );
        })),
      ),
    );
  }
}
