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
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/widgets/component/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
      child: Padding(
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
                  const Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [Text('hiep'), Text('hiep'), Text('hiep')],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
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
      ),
    );
  }
}
