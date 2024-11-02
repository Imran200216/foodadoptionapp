import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDownTextField extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? initialValue;
  final ValueSetter<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomDropDownTextField({
    super.key,
    required this.hintText,
    required this.items,
    this.initialValue,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: initialValue,
      icon: suffixIcon ?? const Icon(Icons.arrow_drop_down),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          color: Colors.grey, // Replace with your subtitle color
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor, // Replace with your textField border color
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor, // Replace with your primary color
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: GoogleFonts.montserrat(
        color: Colors.black, // Replace with your primary color
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          onChanged?.call(value);
        }
      },
    );
  }
}
