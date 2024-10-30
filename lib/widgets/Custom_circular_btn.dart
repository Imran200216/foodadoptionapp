import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';

class CustomCircularBtn extends StatelessWidget {
  final VoidCallback onTap;

  const CustomCircularBtn({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
    );
  }
}
