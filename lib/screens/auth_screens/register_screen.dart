import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodadoptionapp/animations/fade_in_animation.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/auth_providers/email_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/google_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/guest_auth_provider.dart';
import 'package:foodadoptionapp/screens/auth_screens/login_screen.dart';
import 'package:foodadoptionapp/widgets/custom_auth_btn.dart';
import 'package:foodadoptionapp/widgets/custom_icon_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_loading_animation.dart';
import 'package:foodadoptionapp/widgets/custom_social_sign_in_btn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// email auth provider
    final emailAuthProvider = Provider.of<EmailAuthenticationProvider>(context);

    /// google auth provider
    final googleAuthProvider =
        Provider.of<GoogleAuthenticationProvider>(context);

    /// guest auth provider
    final guestAuthProvider = Provider.of<GuestAuthenticationProvider>(context);

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
                    "Discover how your donations help feed families and reduce food waste!",
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

                /// sign in btn for auth
                FadeInAnimation(
                  delay: 1.6,
                  child: CustomSocialSignInBtn(
                    svgWidget: guestAuthProvider.isLoading
                        ? CustomLoadingAnimation(
                            loadingColor: AppColors.primaryColor,
                            loadingSize: 20,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/svg/guest-auth.svg",
                                height: 24,
                                width: 24,
                                fit: BoxFit.cover,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Text(
                                "Sign up with Guest",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                    onTap: () {
                      guestAuthProvider.signInAnonymously(context);
                    },
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                /// sign in btn for google auth
                FadeInAnimation(
                  delay: 1.9,
                  child: CustomSocialSignInBtn(
                    svgWidget: googleAuthProvider.isLoading
                        ? CustomLoadingAnimation(
                            loadingColor: AppColors.primaryColor,
                            loadingSize: 20,
                          )
                        : Row(
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
                                "Sign up with Google",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                    onTap: () {
                      /// sign up with google
                      googleAuthProvider.signInWithGoogle(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                FadeInAnimation(
                  delay: 2.2,
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
                  height: 20,
                ),

                /// User Name text field
                FadeInAnimation(
                  delay: 2.8,
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
                  delay: 3.1,
                  child: CustomIconTextField(
                    controller: emailAuthProvider.registerEmailController,
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
                  delay: 3.4,
                  child: CustomIconTextField(
                    controller: emailAuthProvider.registerPasswordController,
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
                  delay: 3.7,
                  child: CustomIconTextField(
                    controller:
                        emailAuthProvider.registerConfirmPasswordController,
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
          delay: 3.8,
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
                    btnWidget: emailAuthProvider.isLoading
                        ? CustomLoadingAnimation(
                            loadingColor: AppColors.secondaryColor,
                            loadingSize: 20,
                          )
                        : Text(
                            "Sign up",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryColor,
                              fontSize: 16,
                            ),
                          ),
                    onTap: () {
                      /// email register functionality
                      emailAuthProvider.registerWithEmailPassword(context);
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
