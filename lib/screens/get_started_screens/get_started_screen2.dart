import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen2 extends StatelessWidget {
  const GetStartedScreen2({super.key});

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
            "How It Works",
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
            "Donate food easily in just a few steps and make a difference.",
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
            "assets/images/png/get-started-2.png",
            height: 360,
            width: sizeWidth,
            fit: BoxFit.contain,
          ),

          SizedBox(
            height: sizeHeight * 0.02,
          ),

          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.secondaryColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
