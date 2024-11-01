import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_guest_details_provider.dart';
import 'package:foodadoptionapp/widgets/custom_auth_btn.dart';
import 'package:foodadoptionapp/widgets/custom_loading_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GuestUserAvatarScreen extends StatelessWidget {
  final String userId;

  const GuestUserAvatarScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    /// user google details provider
    final userGuestDetailsProvider =
        Provider.of<UserGuestDetailsProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
            bottom: 30,
          ),
          child: Column(
            children: [
              /// circle avatar
              FluttermojiCircleAvatar(
                radius: 100,
              ),
              const SizedBox(
                height: 20,
              ),

              /// customizer avatars
              FluttermojiCustomizer(
                autosave: true,
              ),
              const SizedBox(
                height: 40,
              ),

              /// save avatar btn
              CustomAuthBtn(
                btnWidget: userGuestDetailsProvider.isLoading
                    ? CustomLoadingAnimation(
                        loadingColor: AppColors.secondaryColor,
                        loadingSize: 20,
                      )
                    : Text(
                        "Add avatar",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryColor,
                          fontSize: 16,
                        ),
                      ),
                onTap: () {
                  /// save avatar functionality
                  userGuestDetailsProvider.saveUserAvatarForAnonymousAuth(
                    userId,
                    context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
