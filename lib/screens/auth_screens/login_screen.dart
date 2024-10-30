import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodadoptionapp/animations/fade_in_animation.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/auth_providers/email_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/google_auth_provider.dart';
import 'package:foodadoptionapp/screens/auth_screens/forget_password_screen.dart';
import 'package:foodadoptionapp/screens/auth_screens/register_screen.dart';
import 'package:foodadoptionapp/widgets/custom_auth_btn.dart';
import 'package:foodadoptionapp/widgets/custom_icon_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_loading_animation.dart';
import 'package:foodadoptionapp/widgets/custom_social_sign_in_btn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// email auth provider
    final emailAuthProvider = Provider.of<EmailAuthenticationProvider>(context);

    /// google auth provider
    final googleAuthProvider =
        Provider.of<GoogleAuthenticationProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: Container(
          margin: const EdgeInsets.only(
            left: 20,
            top: 30,
            bottom: 30,
            right: 20,
          ),
          child: Column(
            children: [
              FadeInAnimation(
                delay: 1,
                child: Text(
                  "Welcome to FeedNeed",
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
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
              ),
              const SizedBox(
                height: 40,
              ),

              /// sign in btn for google
              FadeInAnimation(
                delay: 1.6,
                child: CustomSocialSignInBtn(
                  svgWidget: googleAuthProvider.isLoading
                      ? Center(
                          child: CustomLoadingAnimation(
                            loadingColor: AppColors.primaryColor,
                            loadingSize: 20,
                          ),
                        )
                      : Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/svg/google-auth.svg",
                                height: 24,
                                width: 24,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Text(
                                "Continue with Google",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                  onTap: () {
                    /// sign in with google functionality
                    googleAuthProvider.signInWithGoogle(context);
                  },
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              FadeInAnimation(
                delay: 1.9,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.subtitleColor,
                        thickness: 1.0,
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "Or continue with email",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: AppColors.subtitleColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.subtitleColor,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// Email Address text field
              FadeInAnimation(
                delay: 2.3,
                child: CustomIconTextField(
                  controller: emailAuthProvider.loginEmailController,
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
                delay: 2.6,
                child: CustomIconTextField(
                  controller: emailAuthProvider.loginPasswordController,
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
            ],
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
                  /// Login in button
                  CustomAuthBtn(
                    btnWidget: emailAuthProvider.isLoading
                        ? CustomLoadingAnimation(
                            loadingColor: AppColors.secondaryColor,
                            loadingSize: 20,
                          )
                        : Text(
                            "Login in",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryColor,
                              fontSize: 16,
                            ),
                          ),
                    onTap: () {
                      /// login functionality with email
                      emailAuthProvider.loginWithEmailPassword(context);
                    },
                  ),
                  const SizedBox(height: 8),

                  /// Forget password btn
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ForgetPasswordScreen();
                      }));
                    },
                    child: Text(
                      "Forget Password?",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  /// Sign Up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
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
                            return const RegisterScreen();
                          }));
                        },
                        child: Text(
                          "Signup Now.",
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
