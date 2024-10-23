import 'package:flutter/material.dart';
import 'package:foodadoptionapp/animations/fade_in_animation.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/screens/auth_screens/login_screen.dart';
import 'package:foodadoptionapp/widgets/custom_auth_btn.dart';
import 'package:foodadoptionapp/widgets/custom_icon_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 30,
              bottom: 30,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Sign Up heading
                FadeInAnimation(
                  delay: 1,
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// Subtitle
                FadeInAnimation(
                  delay: 1.3,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Discover how your donations help feed families and reduce food waste",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: AppColors.subtitleColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                /// Full Name text field
                FadeInAnimation(
                  delay: 1.6,
                  child: CustomIconTextField(
                    hintText: "Full Name",
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: AppColors.subtitleColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),

                /// User Name text field
                FadeInAnimation(
                  delay: 1.9,
                  child: CustomIconTextField(
                    hintText: "User Name",
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: AppColors.subtitleColor,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),

                /// Email Address text field
                FadeInAnimation(
                  delay: 2,
                  child: CustomIconTextField(
                    hintText: "Email Address",
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: AppColors.subtitleColor,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),

                /// Password text field
                FadeInAnimation(
                  delay: 2.3,
                  child: CustomIconTextField(
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.subtitleColor,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),

                /// Confirm Password text field
                FadeInAnimation(
                  delay: 2.6,
                  child: CustomIconTextField(
                    hintText: "Confirm Password",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.subtitleColor,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: FadeInAnimation(
          delay: 2.9,
          child: Container(
            color: AppColors.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Sign up button
                  CustomAuthBtn(
                    btnText: "Sign up",
                    onTap: () {
                      // Handle sign-up logic here
                    },
                  ),
                  const SizedBox(height: 8),

                  /// Login Now button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: AppColors.subtitleColor,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }));
                        },
                        child: Text(
                          "Login Now.",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
