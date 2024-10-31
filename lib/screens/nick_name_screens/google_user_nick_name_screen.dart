import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_google_details_provider.dart';
import 'package:foodadoptionapp/widgets/custom_auth_btn.dart';
import 'package:foodadoptionapp/widgets/custom_icon_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_loading_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoogleUserNickNameScreen extends StatelessWidget {
  final String userId;

  const GoogleUserNickNameScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    // Get the user ID from the provider or context
    final userGoogleDetailsProvider =
        Provider.of<UserGoogleDetailsProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
              bottom: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add your nickname",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                /// nick name text field
                CustomIconTextField(
                  controller: userGoogleDetailsProvider.nickNameController,
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: AppColors.subtitleColor,
                  ),
                  hintText: "Enter your nickname",
                ),

                const SizedBox(
                  height: 50,
                ),

                CustomAuthBtn(
                  onTap: () {
                    userGoogleDetailsProvider.updateNickname(userId, context);
                  },
                  btnWidget: userGoogleDetailsProvider.isLoading
                      ? CustomLoadingAnimation(
                          loadingColor: AppColors.secondaryColor,
                          loadingSize: 20,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Next",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                color: AppColors.secondaryColor,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 20,
                              color: AppColors.secondaryColor,
                            ),
                          ],
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
