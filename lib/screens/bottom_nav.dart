import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/screen_providers/bottom_nav_provider.dart';
import 'package:foodadoptionapp/screens/bottom_nav_screens/add_homes_screen.dart';
import 'package:foodadoptionapp/screens/bottom_nav_screens/enroll_feeds_screen.dart';
import 'package:foodadoptionapp/screens/bottom_nav_screens/home_screen.dart';
import 'package:foodadoptionapp/screens/bottom_nav_screens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  /// Bottom navigation bar screens
  final List<Widget> widgetList = [
    /// home screen
    const HomeScreen(),

    /// add homes screen
    const AddHomesScreen(),

    /// add enroll feeds screen
    const EnrollFeedsScreen(),

    /// profile screen
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, child) {
        return WillPopScope(
          onWillPop: () async {
            if (bottomNavProvider.currentIndex != 0) {
              // If not on the first screen, go to the previous screen
              bottomNavProvider.setIndex(0);
              return false;
            } else {
              // Allow the app to be popped (exit) if already on the first screen
              return true;
            }
          },
          child: DoubleTapToExit(
            snackBar: SnackBar(
              backgroundColor: AppColors.primaryColor,
              content: Text(
                "Tap again to exit!",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: size.width * 0.040,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.secondaryColor,

                /// Bottom navigation bar
                bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) {
                    HapticFeedback.heavyImpact();
                    bottomNavProvider.setIndex(index);
                  },
                  backgroundColor: AppColors.primaryColor,
                  currentIndex: bottomNavProvider.currentIndex,
                  selectedItemColor: AppColors.primaryColor,
                  unselectedItemColor: AppColors.secondaryColor,
                  unselectedLabelStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryColor,
                  ),
                  selectedLabelStyle: GoogleFonts.montserrat(
                    fontSize: size.width * 0.040,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/svg/home-icon.svg',
                        color: bottomNavProvider.currentIndex == 0
                            ? AppColors.primaryColor
                            : AppColors.subTitleColor,
                        height: size.height * 0.03,
                        width: size.width * 0.03,
                        fit: BoxFit.cover,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/svg/add-icon.svg',
                        color: bottomNavProvider.currentIndex == 1
                            ? AppColors.primaryColor
                            : AppColors.subTitleColor,
                        height: size.height * 0.03,
                        width: size.width * 0.03,
                        fit: BoxFit.cover,
                      ),
                      label: 'Add Homes',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/svg/food-icon.svg',
                        color: bottomNavProvider.currentIndex == 2
                            ? AppColors.primaryColor
                            : AppColors.subTitleColor,
                        height: size.height * 0.03,
                        width: size.width * 0.03,
                        fit: BoxFit.cover,
                      ),
                      label: 'Enroll Feed',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/svg/profile-icon.svg',
                        color: bottomNavProvider.currentIndex == 3
                            ? AppColors.primaryColor
                            : AppColors.subTitleColor,
                        height: size.height * 0.03,
                        width: size.width * 0.03,
                        fit: BoxFit.cover,
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),

                body: IndexedStack(
                  index: bottomNavProvider.currentIndex,
                  children: widgetList,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
