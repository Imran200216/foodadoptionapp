import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSocialSignInBtn extends StatelessWidget {
  final String svgName;
  final String btnText;
  final VoidCallback onTap;

  const CustomSocialSignInBtn(
      {super.key,
      required this.svgName,
      required this.btnText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    /// media query
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: sizeHeight * 0.07,
        width: sizeWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.secondaryColor,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            )),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/svg/$svgName.svg",
                height: 24,
                width: 24,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 14,
              ),
              Text(
                btnText,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
