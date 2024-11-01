import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDescriptionTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final int maxLines;
  final Widget? suffixIcon;

  const CustomDescriptionTextField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: TextField(
        style: GoogleFonts.montserrat(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            color: AppColors.subtitleColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 10.0,
              bottom: 94,
            ),
            child: prefixIcon,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          // Using the prefixIcon here
          suffixIcon: suffixIcon,
          // Using the suffixIcon here if provided
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
          // Adjust padding to reduce height
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
