import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/auth_providers/email_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/google_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/guest_auth_provider.dart';
import 'package:foodadoptionapp/screens/get_started_screen.dart';
import 'package:foodadoptionapp/screens/bottom_nav.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start the timer to check login status and navigate accordingly
    _checkLoginStatus();
  }

  /// login status functionality
  void _checkLoginStatus() async {
    /// google authentication provider
    final googleAuthProvider =
        Provider.of<GoogleAuthenticationProvider>(context, listen: false);

    /// guest authentication provider
    final guestAuthProvider =
        Provider.of<GuestAuthenticationProvider>(context, listen: false);

    /// email authentication provider
    final emailAuthProvider =
        Provider.of<EmailAuthenticationProvider>(context, listen: false);

    /// Check if user is logged in with Google
    if (await googleAuthProvider.isUserGoogleLoggedIn() ||
        await guestAuthProvider.isUserGuestLoggedIn() ||
        await emailAuthProvider.isUserEmailLoggedIn()) {
      // Navigate to BottomNav if logged in
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    } else {
      /// Navigate to GetStartedScreen if not logged in
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const GetStartedScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    /// media query
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      height: sizeHeight,
      width: sizeWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: AppColors.primaryColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/svg/splash-logo.svg",
              height: sizeHeight * 0.18,
              fit: BoxFit.cover,
              color: AppColors.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
