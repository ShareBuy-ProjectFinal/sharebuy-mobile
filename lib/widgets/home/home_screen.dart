import 'package:flutter/material.dart';
import 'package:share_buy/widgets/explore/explore_screen.dart';
import 'package:share_buy/widgets/cart/cart_sreen.dart';
import 'package:share_buy/widgets/home/children/bottom_nav_bar.dart';
import 'package:share_buy/widgets/main/main_screen.dart';
import 'package:share_buy/widgets/order/order_screen.dart';
import 'package:share_buy/widgets/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  int currentIndex;
  HomeScreen({super.key, this.currentIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: const [
            MainScreen(),
            ExploreScreen(),
            CartSreen(),
            OrderScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        pageController: _pageController,
      ),
    );
  }
}
