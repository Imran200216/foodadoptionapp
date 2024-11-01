import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDottedBorderContainer extends StatelessWidget {
  final String title;
  final double titleFontSize;
  final IconData icon;
  final double iconSize;
  final double dottedBorderHeight;
  final double dottedBorderWidth;
  final double dottedBorderRadius;
  final VoidCallback onTap;

  const CustomDottedBorderContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.iconSize,
    required this.dottedBorderHeight,
    required this.dottedBorderWidth,
    required this.titleFontSize,
    required this.dottedBorderRadius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        color: Colors.grey.shade400,
        strokeWidth: 2,
        dashPattern: const [6, 3],
        borderType: BorderType.RRect,
        radius: Radius.circular(dottedBorderRadius),
        child: Container(
          height: dottedBorderHeight,
          width: dottedBorderWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(dottedBorderRadius),
            color: Colors.grey.shade200,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.grey.shade500,
                  size: iconSize,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: GoogleFonts.montserrat(
                    color: Colors.grey.shade500,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
