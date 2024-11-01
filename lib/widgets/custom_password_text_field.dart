import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/auth_providers/password_visibility_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomPasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final String fieldKey;

  const CustomPasswordTextField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    required this.hintText,
    required this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordVisibilityProvider>(
      builder: (
        context,
        passwordVisibilityProvider,
        child,
      ) {
        return TextField(
          obscureText: passwordVisibilityProvider.isObscure(fieldKey),
          style: GoogleFonts.montserrat(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
              color: AppColors.subtitleColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            prefixIcon: prefixIcon,
            // Using the prefixIcon here
            suffixIcon: IconButton(
              onPressed: () {
                // Toggles the visibility when pressed
                passwordVisibilityProvider.toggleVisibility(fieldKey);
              },
              icon: Icon(
                passwordVisibilityProvider.isObscure(fieldKey)
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: passwordVisibilityProvider.isObscure(fieldKey)
                    ? AppColors.textFieldBorderColor
                    : AppColors.primaryColor,
              ),
            ),
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
        );
      },
    );
  }
}
