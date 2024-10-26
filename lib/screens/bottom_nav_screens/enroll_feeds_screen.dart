import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class EnrollFeedsScreen extends StatelessWidget {
  const EnrollFeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 30,
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// title
            Text(
              textAlign: TextAlign.start,
              "Enrolls the foods",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
                fontSize: 22,
              ),
            ),

            const SizedBox(
              height: 20,
            ),


          ],
        ),
      ),
    );
  }
}
