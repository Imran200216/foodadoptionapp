import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/add_homes_provider/add_homes_provider.dart';
import 'package:foodadoptionapp/widgets/custom_auth_btn.dart';
import 'package:foodadoptionapp/widgets/custom_description_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_drop_down_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_icon_text_field.dart';
import 'package:foodadoptionapp/widgets/custom_image_picker_bottom_sheet.dart';
import 'package:foodadoptionapp/widgets/custom_loading_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:provider/provider.dart';

class AddHomesScreen extends StatelessWidget {
  const AddHomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// add homes provider
    final addHomesProvider = Provider.of<AddHomesProvider>(context);

    /// media query
    final size = MediaQuery.of(context).size;

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
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CustomImagePickerBottomSheet(
                        onImagePicked: (ImageSource source) {
                          addHomesProvider.pickImage(source, context);
                          Navigator.pop(context); // Close the bottom sheet
                        },
                      );
                    },
                  );
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: const [6, 6],
                  color: Colors.grey.shade400,
                  radius: const Radius.circular(12),
                  strokeWidth: 2,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey.shade200,
                    ),
                    child: PageView.builder(
                      controller: addHomesProvider.pageController,
                      itemCount: addHomesProvider.homeImages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == addHomesProvider.homeImages.length) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload_file_outlined,
                                    color: Colors.grey.shade500,
                                    size: 26,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Upload an image",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.grey.shade500,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          // Show picked images
                          return InstaImageViewer(
                            backgroundColor: AppColors.primaryColor,
                            disableSwipeToDismiss: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.file(
                                addHomesProvider.homeImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// name of your organization
              CustomIconTextField(
                controller: addHomesProvider.homeNameController,
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
                controller: addHomesProvider.homeDescriptionController,
                prefixIcon: Icon(
                  Icons.description_outlined,
                  color: AppColors.subtitleColor,
                ),
                hintText: "Description of the organization*",
                maxLines: 5,
              ),

              const SizedBox(height: 30),

              /// upload an license pdf
              InkWell(
                onTap: () {
                  addHomesProvider.pickPdf(context);
                },
                child: DottedBorder(
                  color: Colors.grey.shade400,
                  strokeWidth: 2,
                  dashPattern: const [6, 3],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: addHomesProvider.homePdf != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.picture_as_pdf,
                                  color: AppColors.primaryColor,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  " ${addHomesProvider.homePdf!.path.split('/').last}",
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          : addHomesProvider.isLoading
                              ? CustomLoadingAnimation(
                                  loadingColor: AppColors.primaryColor,
                                  loadingSize: 20,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.picture_as_pdf,
                                      color: Colors.grey.shade500,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      "Upload an license pdf*",
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
              ),

              const SizedBox(height: 30),

              /// location of your organization
              CustomIconTextField(
                controller: addHomesProvider.homeLocationController,
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
