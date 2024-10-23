import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAuthBtn extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;

  const CustomAuthBtn({
    super.key,
    required this.btnText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    /// media query
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: sizeWidth,
        height: sizeHeight * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            btnText,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: AppColors.secondaryColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
