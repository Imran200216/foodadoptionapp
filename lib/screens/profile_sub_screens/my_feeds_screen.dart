import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/screens/bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFeedsScreen extends StatelessWidget {
  const MyFeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return BottomNavBar();
                      }));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "My Feeds",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
