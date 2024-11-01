import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/auth_providers/email_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/google_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/guest_auth_provider.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_email_details_provider.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_google_details_provider.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_guest_details_provider.dart';
import 'package:foodadoptionapp/screens/profile_sub_screens/about_app_screen.dart';
import 'package:foodadoptionapp/screens/profile_sub_screens/my_feeds_screen.dart';
import 'package:foodadoptionapp/widgets/custom_cached_network_image.dart';
import 'package:foodadoptionapp/widgets/custom_profile_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Delaying the fetch operation until after the first build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && user.isAnonymous) {
        // Fetch guest user details
        Provider.of<UserGuestDetailsProvider>(context, listen: false)
            .fetchGuestUserDetails(context);
      } else if (user != null && user.email != null) {
        // Fetch email user details
        Provider.of<UserEmailDetailsProvider>(context, listen: false)
            .fetchEmailUserDetails(context);
      } else if (user != null) {
        // Fetch Google user details
        Provider.of<UserGoogleDetailsProvider>(context, listen: false)
            .fetchGoogleUserDetails(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// current user
    final user = FirebaseAuth.instance.currentUser;

    /// user google details provider
    final userGoogleDetailsProvider =
        Provider.of<UserGoogleDetailsProvider>(context);

    /// user email details provider
    final userEmailDetailsProvider =
        Provider.of<UserEmailDetailsProvider>(context);

    /// user guest details provider
    final userGuestDetailsProvider =
        Provider.of<UserGuestDetailsProvider>(context);

    /// google auth provider
    final googleAuthProvider =
        Provider.of<GoogleAuthenticationProvider>(context);

    /// email auth provider
    final emailAuthProvider = Provider.of<EmailAuthenticationProvider>(context);

    /// guest auth provider
    final guestAuthProvider = Provider.of<GuestAuthenticationProvider>(context);

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
              Text(
                textAlign: TextAlign.start,
                "Profile",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 30),

              /// avatar image
              CustomCachedImage(
                height: 150,
                width: 150,
                fit: BoxFit.contain,
                imageUrl: user?.isAnonymous == true
                    ? userGuestDetailsProvider.avatarPhotoURL
                    : (user?.email != null
                        ? userEmailDetailsProvider.avatarPhotoURL
                        : userGoogleDetailsProvider.avatarPhotoURL),
                errorIconSize: 20,
                errorIconColor: AppColors.primaryColor,
                loadingIconColor: AppColors.primaryColor,
                loadingIconSize: 20,
              ),
              const SizedBox(height: 12),

              /// nickname
              Text(
                user?.isAnonymous == true
                    ? userGuestDetailsProvider.nickName
                    : (user?.email != null
                        ? userEmailDetailsProvider.nickName
                        : userGoogleDetailsProvider.nickName),
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: user!.isAnonymous ? 18 : (user.email != null ? 6 : 6),
              ),

              /// email address
              user.isAnonymous
                  ? const SizedBox()
                  : user.email != null
                      ? Column(
                          children: [
                            Text(
                              /// email auth (email address)
                              user.email ?? "No email",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textFieldHintTextColor,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        )
                      : Text(
                          /// google auth (email address)
                          user.email ?? "No email",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textFieldHintTextColor,
                            fontSize: 16,
                          ),
                        ),
              const SizedBox(height: 20),

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
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const MyFeedsScreen();
                        }));
                      },
                      prefixIcon: Icons.feed,
                    ),

                    /// about app
                    CustomProfileListTile(
                      tileTitle: "About app",
                      iconSize: 26,
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const AboutAppScreen();
                        }));
                      },
                      prefixIcon: Icons.help,
                    ),

                    /// sign out
                    CustomProfileListTile(
                      tileTitle: "Logout",
                      iconSize: 26,
                      onTap: user.isAnonymous
                          ? () => guestAuthProvider.signOut(context)
                          : (user.email != null
                              ? () =>
                                  emailAuthProvider.signOutWithEmail(context)
                              : () => googleAuthProvider.signOut(context)),
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
