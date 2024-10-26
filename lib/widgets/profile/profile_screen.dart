import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/blocs/auth_bloc/auth_event.dart';
import 'package:share_buy/blocs/auth_bloc/auth_state.dart';
import 'package:share_buy/widgets/component/custom_button.dart';
import 'package:share_buy/widgets/profile/children/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<ProfileItemModel> profileItems = [
      ProfileItemModel(
          title: 'Hồ sơ',
          iconUrl: 'assets/icons/icon_user_blue.png',
          onTap: () {}),
      ProfileItemModel(
          title: 'Đặt hàng',
          iconUrl: 'assets/icons/icon_bag.png',
          onTap: () {
            Navigator.of(context).pushNamed(NavigatorName.PURCHASE_SCREEN);
          }),
      ProfileItemModel(
          title: 'Địa chỉ',
          iconUrl: 'assets/icons/icon_maker.png',
          onTap: () {}),
      ProfileItemModel(
          title: 'Thanh toán',
          iconUrl: 'assets/icons/icon_pay.png',
          onTap: () {})
    ];
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state.isLogoutSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              NavigatorName.LOGIN_SCREEN, (route) => false);
          state.isLogoutSuccess = false;
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tài khoản',
                style: AppTypography.headerAppbarStyle,
              ),
              SizedBox(
                height: 12.h,
              ),
              const Divider(
                height: 1,
                color: AppColors.borderTextfieldColor,
              ),
              SizedBox(
                height: 12.h,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/images/avatar.png',
                      width: 120,
                      height: 120,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(state.user.fullName ?? ''),
                        SizedBox(
                          height: 12.w,
                        ),
                        Text(state.user.email ?? ''),
                        SizedBox(
                          height: 12.w,
                        ),
                        Text(state.user.role ?? ''),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProfileItem(
                      title: profileItems[index].title,
                      iconUrl: profileItems[index].iconUrl,
                      onTap: profileItems[index].onTap,
                    );
                  },
                  itemCount: profileItems.length,
                ),
              ),
              CustomButton(
                  buttonColor: AppColors.buttonBlue,
                  buttonText: 'Đăng xuất',
                  onTap: () {
                    context.read<AuthBloc>().add(EventLogout());
                  },
                  textColor: AppColors.white)
            ],
          ),
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProfileItemModel {
  final String title;
  final String iconUrl;
  VoidCallback onTap;

  ProfileItemModel({
    required this.title,
    required this.iconUrl,
    required this.onTap,
  });
}
