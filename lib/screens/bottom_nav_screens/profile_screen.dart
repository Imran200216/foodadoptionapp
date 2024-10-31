import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_email_details_provider.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_google_details_provider.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_guest_details_provider.dart';
import 'package:foodadoptionapp/widgets/custom_cached_network_image.dart';
import 'package:foodadoptionapp/widgets/custom_profile_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// current user
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && user.isAnonymous) {
      /// guest auth
    } else if (user != null && user.email != null) {
      /// email auth
    } else {
      /// google auth
      Provider.of<UserGoogleDetailsProvider>(context, listen: false)
          .fetchGoogleUserDetails(context);
    }

    /// user google details provider
    final userGoogleDetailsProvider =
        Provider.of<UserGoogleDetailsProvider>(context);

    /// user email details provider
    final userEmailDetailsProvider =
        Provider.of<UserEmailDetailsProvider>(context);

    /// user guest details provider
    final userGuestDetailsProvider =
        Provider.of<UserGuestDetailsProvider>(context);

    return Scaffold(
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
            children: [
              /// profile text
              Text(
                textAlign: TextAlign.start,
                "Profile",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  fontSize: 22,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              CustomCachedImage(
                height: 150,
                width: 150,
                fit: BoxFit.contain,
                imageUrl: userGoogleDetailsProvider.avatarPhotoURL,
                errorIconSize: 20,
                errorIconColor: AppColors.primaryColor,
                loadingIconColor: AppColors.primaryColor,
                loadingIconSize: 20,
              ),

              const SizedBox(
                height: 12,
              ),

              /// person name text
              Text(
                textAlign: TextAlign.start,
                userGoogleDetailsProvider.nickName,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 6,
              ),

              /// email address text
              Text(
                textAlign: TextAlign.start,
                user!.email ?? "No email",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textFieldHintTextColor,
                  fontSize: 16,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFEBF3FB),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// my feeds
                    CustomProfileListTile(
                      tileTitle: "My Feeds",
                      iconSize: 26,
                      onTap: () {},
                      prefixIcon: Icons.feed,
                    ),

                    /// about app
                    CustomProfileListTile(
                      tileTitle: "About app",
                      iconSize: 26,
                      onTap: () {},
                      prefixIcon: Icons.help,
                    ),

                    /// logout
                    CustomProfileListTile(
                      tileTitle: "Logout",
                      iconSize: 26,
                      onTap: () {},
                      prefixIcon: Icons.logout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
