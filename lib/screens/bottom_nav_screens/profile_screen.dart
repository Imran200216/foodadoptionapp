import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/widgets/custom_profile_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              Stack(
                children: [
                  /// avatar photo url
                  Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=1966&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /// edit icon
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        print("hello");
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF5646E5),
                          border: Border.all(
                            color: AppColors.secondaryColor,
                            width: 1.4,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            color: AppColors.secondaryColor,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 12,
              ),

              /// person name text
              Text(
                textAlign: TextAlign.start,
                "Imran B",
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
                "imran@gmail.com",
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
