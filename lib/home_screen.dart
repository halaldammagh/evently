import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home/tabs/favorite/favorite_tab.dart';
import 'package:evently/home/tabs/home/home_tab.dart';
import 'package:evently/home/tabs/profile/profile_tab.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [HomeTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          buildBottomNavBarItem(
            index: 0,
            selectedIcon: Image.asset(AppAssets.homeSelectedIcon),
            unSelectedIcon: Image.asset(AppAssets.homeUnSelectedIcon),
            label: 'home',
          ),
          buildBottomNavBarItem(
            index: 1,
            selectedIcon: Image.asset(AppAssets.favSelectedIcon),
            unSelectedIcon: Image.asset(AppAssets.favUnSelectedIcon),
            label: 'favorite',
          ),
          buildBottomNavBarItem(
            index: 2,
            selectedIcon: Image.asset(AppAssets.profileSelectedIcon),
            unSelectedIcon: Image.asset(AppAssets.profileUnSelectedIcon),
            label: 'profile',
          ),
        ],
      ),
      body: tabsList[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addEventRoute);
        },
        child: Icon(Icons.add, size: 30, color: AppColors.white),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem({
    required Widget selectedIcon,
    required Widget unSelectedIcon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index ? selectedIcon : unSelectedIcon,
      label: label.tr(),
    );
  }
}
