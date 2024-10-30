import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';

class CustomSocialSignInBtn extends StatelessWidget {
  final VoidCallback onTap;
  final Widget svgWidget;

  const CustomSocialSignInBtn({
    super.key,
    required this.onTap,
    required this.svgWidget,
  });

  @override
  Widget build(BuildContext context) {
    /// media query
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: sizeHeight * 0.062,
        width: sizeWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.secondaryColor,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            )),
        child: svgWidget,
      ),
    );
  }
}
