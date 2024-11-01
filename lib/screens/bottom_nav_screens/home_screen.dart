import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/screen_providers/home_carousel_provider.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_guest_details_provider.dart';
import 'package:foodadoptionapp/widgets/custom_cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// images list
    final List<String> imageUrls = [
      "https://i.pinimg.com/564x/36/64/44/366444071d08578131f3f9fd905baa5f.jpg",
      "https://i.pinimg.com/564x/20/38/47/20384789a69a1218aa86e37270b8aee1.jpg",
      "https://i.pinimg.com/564x/41/df/e6/41dfe6d62c15e8e17090f4424ef7e9f4.jpg",
    ];

    /// user dummy profile
    const userDummyProfile =
        "https://imgs.search.brave.com/Jr4F26FmavL_arvWQ51hTUtcX3UgHOWlH0F9fqfo5Cc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9mcmVl/c3ZnLm9yZy9pbWcv/YWJzdHJhY3QtdXNl/ci1mbGF0LTQucG5n";

    /// current user
    final user = FirebaseAuth.instance.currentUser;

    /// user guest details provider
    final userGuestDetailsProvider =
        Provider.of<UserGuestDetailsProvider>(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 30,
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// title
                Text(
                  textAlign: TextAlign.start,
                  "Feed the meals to\nNeedy!",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    fontSize: 22,
                  ),
                ),

                /// avatar image
                ClipOval(
                  child: CustomCachedImage(
                    height: 52,
                    width: 52,
                    fit: BoxFit.contain,
                    imageUrl: user?.isAnonymous == true
                        ? userGuestDetailsProvider.avatarPhotoURL
                        : (user?.email != null
                            ? user!.photoURL ?? userDummyProfile
                            : user!.photoURL ?? userDummyProfile),
                    errorIconSize: 14,
                    errorIconColor: AppColors.primaryColor,
                    loadingIconColor: AppColors.primaryColor,
                    loadingIconSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 24,
            ),

            /// search text field
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Search trust, homes',
                  hintStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: AppColors.subtitleColor,
                    fontSize: 15,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  suffixIcon: Icon(Icons.tune, color: AppColors.primaryColor),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            /// slider of images
            Consumer<HomeCarouselProvider>(
              builder: (context, provider, child) {
                return SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: PageView.builder(
                    itemCount: imageUrls.length,
                    controller: provider.controller,
                    onPageChanged: (index) {
                      provider.setActiveIndex(index);
                    },
                    itemBuilder: (context, index) {
                      final url = imageUrls[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 16.0),

            /// smooth page indicator of slider
            Consumer<HomeCarouselProvider>(
              builder: (context, provider, child) {
                return AnimatedSmoothIndicator(
                  activeIndex: provider.activeIndex,
                  count: imageUrls.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primaryColor,
                    dotColor: AppColors.textFieldHintTextColor,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                  onDotClicked: (index) {
                    provider.animateToPage(index);
                  },
                );
              },
            ),

            const SizedBox(height: 16.0),

            ///
          ],
        ),
      ),
    );
  }
}
