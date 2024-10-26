import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/screen_providers/bottom_nav_provider.dart';
import 'package:foodadoptionapp/screens/bottom_nav_screens/add_homes_screen.dart';
import 'package:foodadoptionapp/screens/bottom_nav_screens/enroll_feeds_screen.dart';
import 'package:foodadoptionapp/screens/bottom_nav_screens/home_screen.dart';
import 'package:foodadoptionapp/screens/bottom_nav_screens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    /// screens
    List<Widget> buildScreens() {
      return [
        /// home screen
        const HomeScreen(),

        /// add homes screen
        const AddHomesScreen(),

        /// add enroll feeds screen
        const EnrollFeedsScreen(),

        /// profile screen
        const ProfileScreen(),
      ];
    }

    /// nav bar items
    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ("Home"),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
          ),
          // Icon and text color when selected
          activeColorPrimary: AppColors.primaryColor,
          // Icon and text color when not selected
          inactiveColorPrimary: AppColors.primaryColor,
          // Icon color when selected
          activeColorSecondary: AppColors.secondaryColor,
          // Icon color when not selected
          inactiveColorSecondary: AppColors.primaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.add_circled),
          title: ("Add Serves"),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
          ),
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.primaryColor,
          activeColorSecondary: AppColors.secondaryColor,
          inactiveColorSecondary: AppColors.primaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.food_bank_outlined),
          title: ("Enroll"),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
          ),
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.primaryColor,
          activeColorSecondary: AppColors.secondaryColor,
          inactiveColorSecondary: AppColors.primaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.profile_circled),
          title: ("Profile"),
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
          ),
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.primaryColor,
          activeColorSecondary: AppColors.secondaryColor,
          inactiveColorSecondary: AppColors.primaryColor,
        ),
      ];
    }

    return SafeArea(
      child: Scaffold(
        body: Consumer<BottomNavProvider>(
          builder: (context, bottomNavProvider, child) {
            return PersistentTabView(
              context,
              controller: bottomNavProvider.controller,
              screens: buildScreens(),
              items: navBarsItems(),
              onItemSelected: (value) {
                bottomNavProvider.changeTabIndex(value);
              },
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset: true,
              stateManagement: true,
              hideNavigationBarWhenKeyboardAppears: true,
              padding: const EdgeInsets.only(top: 8),
              backgroundColor: AppColors.secondaryColor,
              isVisible: true,
              confineToSafeArea: true,
              navBarHeight: kBottomNavigationBarHeight,
              navBarStyle: NavBarStyle.style7,
            );
          },
        ),
      ),
    );
  }
}
