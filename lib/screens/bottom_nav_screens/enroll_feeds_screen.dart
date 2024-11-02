import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/widgets/custom_description_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_drop_down_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_icon_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class EnrollFeedsScreen extends StatelessWidget {
  const EnrollFeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                "Add your enrolls",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  fontSize: 22,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              DottedBorder(
                color: Colors.grey.shade400,
                strokeWidth: 2,
                dashPattern: const [6, 3],
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file_outlined,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Upload an image*",
                          style: GoogleFonts.montserrat(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// name of the enroller
              CustomIconTextField(
                prefixIcon: Icon(
                  Icons.person_outlined,
                  color: AppColors.subtitleColor,
                ),
                hintText: "Name of the enroller*",
              ),

              const SizedBox(
                height: 30,
              ),

              /// description of the enroller
              CustomDescriptionTextField(
                prefixIcon: Icon(
                  Icons.description_outlined,
                  color: AppColors.subtitleColor,
                ),
                hintText: "Description of the Enroller*",
                maxLines: 5,
              ),

              const SizedBox(
                height: 30,
              ),

              /// enroller type
              CustomDropDownTextField(
                prefixIcon: Icon(
                  Icons.category_outlined,
                  color: AppColors.subtitleColor,
                ),
                hintText: "Enroller type*",
                items: const [
                  "Personal",
                  "Private Organizations",
                  "Governmental Organization",
                  "Non Governmental Organization",
                  "Specified Trust"
                ],
              ),

              /// enroller profile

            ],
          ),
        ),
      ),
    );
  }
}
