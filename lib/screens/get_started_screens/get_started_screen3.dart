import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/screens/auth_screens/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen3 extends StatelessWidget {
  const GetStartedScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    /// media query
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 30,
        bottom: 30,
      ),
      child: Column(
        children: [
          /// title
          Text(
            textAlign: TextAlign.center,
            "Join the Cause",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
              fontSize: 26,
            ),
          ),
          SizedBox(
            height: sizeHeight * 0.02,
          ),

          /// sub title
          Text(
            textAlign: TextAlign.center,
            "Your small contribution can make a big impact in someone's life.",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: AppColors.subtitleColor,
              fontSize: 16,
            ),
          ),

          SizedBox(
            height: sizeHeight * 0.08,
          ),

          Image.asset(
            "assets/images/png/get-started-3.png",
            height: 360,
            width: sizeWidth,
            fit: BoxFit.contain,
          ),

          SizedBox(
            height: sizeHeight * 0.02,
          ),

          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const RegisterScreen();
              }));
            },
            child: Container(
              height: 60,
              width: 160,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(14),
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: Text(
                  "Get Started",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
