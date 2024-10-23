import 'package:flutter/material.dart';
import 'package:foodadoptionapp/animations/fade_in_animation.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/screens/auth_screens/login_screen.dart';

import 'package:foodadoptionapp/widgets/custom_auth_btn.dart';
import 'package:foodadoptionapp/widgets/custom_icon_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
            bottom: 30,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInAnimation(
                  delay: 1,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.fingerprint_sharp,
                        color: AppColors.subtitleColor,
                        size: 34,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                FadeInAnimation(
                  delay: 1.3,
                  child: Text(
                    "Forgot password?",
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
                  delay: 1.6,
                  child: Text(
                    textAlign: TextAlign.center,
                    "No worries, we'll send you reset instructions",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: AppColors.subtitleColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                FadeInAnimation(
                  delay: 1.9,
                  child: CustomIconTextField(
                    hintText: "Email Address",
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: AppColors.subtitleColor,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                /// Login in button
                FadeInAnimation(
                  delay: 2.3,
                  child: CustomAuthBtn(
                    btnText: "Resent password link",
                    onTap: () {
                      // Handle sign-up logic here
                    },
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  child: FadeInAnimation(
                    delay: 2.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: AppColors.subtitleColor,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Back to login in",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: AppColors.subtitleColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
