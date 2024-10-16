import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/routes/route_generator.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:share_buy/blocs/cart_bloc/cart_bloc.dart';
import 'package:share_buy/blocs/home_bloc/home_bloc.dart';
import 'package:share_buy/blocs/product_bloc/product_bloc.dart';
import 'package:share_buy/widgets/login/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
        BlocProvider<CartBloc>(create: (context) => CartBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return GlobalLoaderOverlay(
            overlayColor: Colors.grey.withOpacity(0.8),
            useDefaultLoading: false,
            overlayWidgetBuilder: (_) {
              return const Center(
                child: SpinKitCubeGrid(
                  color: AppColors.buttonBlue,
                  size: 70,
                ),
              );
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: appTheme,
              home: child,
              onGenerateRoute: RouteGenerator.generateRoute,
            ),
          );
        },
        child: const LoginScreen(),
      ),
    );
  }
}
