import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDownTextField extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? initialValue;
  final ValueSetter<String>? onChanged; // Ensure the type is String
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
    return DropDownTextField(
      textStyle: GoogleFonts.montserrat(
        color: AppColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      initialValue: initialValue != null
          ? DropDownValueModel(name: initialValue!, value: initialValue!)
          : null,
      clearOption: true,
      enableSearch: false,
      dropDownItemCount: items.length,
      textFieldDecoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          color: AppColors.subtitleColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
      listTextStyle: GoogleFonts.montserrat(
        color: AppColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      dropDownList: items
          .map((item) => DropDownValueModel(name: item, value: item))
          .toList(),
      onChanged: (value) {
        // Ensure that value is non-null and is of the correct type
        if (value.value is String) {
          onChanged?.call(value
              .value); // Call the onChanged callback with the selected value
        }
      },
    );
  }
}
