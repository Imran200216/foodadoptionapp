import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProfileListTile extends StatelessWidget {
  final double iconSize;
  final VoidCallback onTap;
  final IconData prefixIcon;
  final String tileTitle;

  const CustomProfileListTile({
    super.key,
    required this.iconSize,
    required this.onTap,
    required this.prefixIcon,
    required this.tileTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          prefixIcon,
          size: iconSize,
          color: AppColors.primaryColor,
        ),
        title: Text(tileTitle),
        titleTextStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
          fontSize: 17,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
