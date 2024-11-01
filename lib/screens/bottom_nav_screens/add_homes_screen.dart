import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/add_homes_provider/add_homes_provider.dart';
import 'package:foodadoptionapp/widgets/custom_auth_btn.dart';
import 'package:foodadoptionapp/widgets/custom_description_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_dotted_border_container.dart';
import 'package:foodadoptionapp/widgets/custom_drop_down_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_icon_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddHomesScreen extends StatelessWidget {
  const AddHomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// add homes provider
    final addHomesProvider = Provider.of<AddHomesProvider>(context);

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
                "Add Homes",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 20),

              /// upload an image
              CustomDottedBorderContainer(
                title: "Upload an image*",
                icon: Icons.upload_file,
                iconSize: 30,
                dottedBorderHeight: 300,
                dottedBorderWidth: double.maxFinite,
                titleFontSize: 16,
                dottedBorderRadius: 20,
                onTap: () {
                  /// upload image functionality
                },
              ),

              const SizedBox(height: 40),

              /// name of your organization
              CustomIconTextField(
                hintText: "Name of the organization*",
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: AppColors.subtitleColor,
                ),
              ),

              const SizedBox(height: 30),

              /// Homes needs
              CustomDropDownTextField(
                hintText: "Organization need",
                items: const [
                  "Financial Need",
                  "Food Need",
                  "Shelter Need",
                  "Hospital Need",
                ],
                initialValue:
                    addHomesProvider.selectedValue ?? "Financial Need",
                // Fallback value
                onChanged: (value) {
                  addHomesProvider.setSelectedValue(value);
                },
                prefixIcon: Icon(
                  Icons.help_outline,
                  color: AppColors.subtitleColor,
                ),
              ),

              const SizedBox(height: 30),

              /// description of organization
              CustomDescriptionTextField(
                prefixIcon: Icon(
                  Icons.description_outlined,
                  color: AppColors.subtitleColor,
                ),
                hintText: "Description of the organization*",
                maxLines: 5,
              ),

              const SizedBox(height: 30),

              /// upload an license pdf
              CustomDottedBorderContainer(
                title: "Upload an license pdf*",
                icon: Icons.picture_as_pdf,
                iconSize: 30,
                dottedBorderHeight: 100,
                dottedBorderWidth: double.maxFinite,
                titleFontSize: 16,
                dottedBorderRadius: 10,
                onTap: () {
                  /// upload image functionality
                },
              ),

              const SizedBox(height: 30),

              /// location of your organization
              CustomIconTextField(
                hintText: "Location of the organization*",
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.subtitleColor,
                ),
              ),

              const SizedBox(height: 60),

              /// add homes btn
              CustomAuthBtn(
                btnWidget: Text(
                  "Add Homes",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryColor,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  /// add homes functionality
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
