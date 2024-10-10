import 'package:flutter/material.dart';
import 'package:share_buy/widgets/explore/explore_screen.dart';
import 'package:share_buy/widgets/home/children/bottom_nav_bar.dart';
import 'package:share_buy/widgets/main/main_screen.dart';
import 'package:share_buy/widgets/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: const [
            MainScreen(),
            ExploreScreen(),
            ExploreScreen(),
            ExploreScreen(),
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
