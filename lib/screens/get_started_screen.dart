import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/screen_providers/get_started_provider.dart';
import 'package:foodadoptionapp/screens/get_started_screens/get_started_screen1.dart';
import 'package:foodadoptionapp/screens/get_started_screens/get_started_screen2.dart';
import 'package:foodadoptionapp/screens/get_started_screens/get_started_screen3.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: Consumer<GetStartedProvider>(
          builder: (
            context,
            getStartedProvider,
            child,
          ) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: PageView(
                      controller: getStartedProvider.pageController,
                      children: const [
                        GetStartedScreen1(),
                        GetStartedScreen2(),
                        GetStartedScreen3(),
                      ],
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: getStartedProvider.pageController,
                  // Updated reference
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primaryColor,
                    dotColor: Colors.grey.shade300,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 3,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
