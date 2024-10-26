import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/screen_providers/home_carousel_provider.dart';
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

                /// avatar photo url
                Container(
                  height: 66,
                  width: 66,
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
