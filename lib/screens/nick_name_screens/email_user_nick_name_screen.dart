import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/widgets/custom_auth_btn.dart';
import 'package:foodadoptionapp/widgets/custom_cached_network_image.dart';
import 'package:foodadoptionapp/widgets/custom_icon_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailUserNickNameScreen extends StatelessWidget {
  const EmailUserNickNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: ClipOval(
                    child: CustomCachedImage(
                      imageUrl:
                          "https://images.unsplash.com/photo-1503681965625-d2a39869ba05?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      errorIconSize: 20,
                      errorIconColor: AppColors.primaryColor,
                      loadingIconColor: AppColors.primaryColor,
                      loadingIconSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                /// nick name text field
                CustomIconTextField(
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
                  onTap: () {},
                  btnWidget: Row(
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
