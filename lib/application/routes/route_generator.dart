import 'package:flutter/material.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/widgets/favourite/favourite_screen.dart';
import 'package:share_buy/widgets/home/home_screen.dart';
import 'package:share_buy/widgets/login/login_screen.dart';
import 'package:share_buy/widgets/login/login_screen.dart';
import 'package:share_buy/widgets/notification/notification_screen.dart';
import 'package:share_buy/widgets/product_detail/product_detail_screen.dart';
import 'package:share_buy/widgets/purchase/purchase_screen.dart';
import 'package:share_buy/widgets/rate/rate_screen.dart';
import 'package:share_buy/widgets/rate_comment_form/rate_comment_form_screen.dart';
import 'package:share_buy/widgets/sale_program_detail/sale_program_detail_screen.dart';
import 'package:share_buy/widgets/search_result/search_result_screen.dart';
import 'package:share_buy/widgets/sign_up/sign_up_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      case NavigatorName.SIGN_UP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case NavigatorName.HOME_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case NavigatorName.SALE_PROGRAM_SCREEN:
        return MaterialPageRoute(
          builder: (_) => SaleProgramDetailScreen(
            title: args!['title'],
          ),
        );
      case NavigatorName.FAVOURITE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const FavouriteScreen(),
        );
      case NavigatorName.RATE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const RateScreen(),
        );
      case NavigatorName.RATE_COMMENT_FORM_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const RateCommentFormScreen(),
        );
      case NavigatorName.PRODUCT_DETAIL_SCREEN:
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(
            product: args!['product'],
          ),
        );
      case NavigatorName.NOTIFICATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );
      case NavigatorName.SEARCH_RESULT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const SearchResultScreen(),
        );
      case NavigatorName.PURCHASE_SCREEN:
        return MaterialPageRoute(builder: (_) => const PurchaseScreen());
      case NavigatorName.LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: AppColors.primary,
            body: Container(
              color: Colors.amber,
              child: Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(_),
                  child: const Text("Quay trở lại"),
                ),
              ),
            ),
          ),
        );
    }
  }
}
