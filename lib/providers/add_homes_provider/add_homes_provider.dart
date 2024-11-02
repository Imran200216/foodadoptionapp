import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/helpers/toast_helper.dart';
import 'package:foodadoptionapp/modals/home_modal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddHomesProvider extends ChangeNotifier {
  /// Loading state
  bool _isLoading = false; // Loading state variable
  bool get isLoading => _isLoading;

  /// Helper method to manage the loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? _selectedValue; // Make it nullable

  // Getter for selectedValue
  String? get selectedValue => _selectedValue;

  void setSelectedValue(String newValue) {
    _selectedValue = newValue;
    notifyListeners();
  }

  /// Controllers
  final TextEditingController homeNameController = TextEditingController();
  final TextEditingController homeDescriptionController =
      TextEditingController();
  final TextEditingController homeLocationController = TextEditingController();

  /// List of home images and PDFs
  List<File> homeImages = [];
  File? homePdf; // To store the selected PDF file

  // Firebase Storage and Firestore instances
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final PageController pageController = PageController();

  /// Method to pick an image from gallery or camera
  Future<void> pickImage(ImageSource source, BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    // Check for permission based on the source (Camera or Gallery)
    if (source == ImageSource.camera) {
      var status = await Permission.camera.status;
      if (!status.isGranted) {
        status = await Permission.camera.request();
        if (!status.isGranted) {
          ToastHelper.showErrorToast(
            context: context,
            message: "Camera permission is required to take pictures.",
          );
          return;
        }
      }
    } else if (source == ImageSource.gallery) {
      var status = await Permission.photos.status;
      if (!status.isGranted) {
        status = await Permission.photos.request();
        if (!status.isGranted) {
          ToastHelper.showErrorToast(
            context: context,
            message: "Gallery access is required to pick images.",
          );
          return;
        }
      }
    }

    // Pick the image
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      homeImages.add(File(pickedFile.path));
      ToastHelper.showSuccessToast(
        context: context,
        message: "Image picked successfully!",
      );
      notifyListeners();
    } else {
      ToastHelper.showErrorToast(
        context: context,
        message: "No image selected!",
      );
    }
  }

  /// Method to pick a PDF file from the file system
  Future<void> pickPdf(BuildContext context) async {
    // Request permission for file access
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        ToastHelper.showErrorToast(
          context: context,
          message: "Storage permission is required to pick PDFs.",
        );
        return;
      }
    }

    // Pick the PDF file using FilePicker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      homePdf = File(result.files.single.path!); // Ensure the path is non-null
      ToastHelper.showSuccessToast(
        context: context,
        message: "PDF picked successfully!",
      );
      notifyListeners();
    } else {
      ToastHelper.showErrorToast(
        context: context,
        message: "No PDF selected!",
      );
    }
  }

  /// Method to upload images to Firebase Storage and return the list of URLs
  Future<List<String>> uploadImages(
      String homeName, BuildContext context) async {
    List<String> imageUrls = [];

    for (File image in homeImages) {
      try {
        Reference storageRef = _storage
            .ref()
            .child('homes/$homeName/images/${DateTime.now()}.jpg');
        UploadTask uploadTask = storageRef.putFile(image);
        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      } catch (e) {
        ToastHelper.showErrorToast(
          context: context,
          message: "Failed to upload image: $e",
        );
      }
    }

    return imageUrls;
  }

  /// Method to upload PDF to Firebase Storage and return the URL
  Future<String?> uploadPdf(String homeName, BuildContext context) async {
    if (homePdf == null) return null; // Return null if no PDF is selected

    try {
      Reference storageRef =
          _storage.ref().child('homes/$homeName/pdfs/${DateTime.now()}.pdf');
      UploadTask uploadTask = storageRef.putFile(homePdf!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl; // Return the PDF URL
    } catch (e) {
      ToastHelper.showErrorToast(
        context: context,
        message: "Failed to upload PDF: $e",
      );
      return null; // Return null if upload fails
    }
  }

  /// Add homes to Firestore
  Future<void> addHomeToFireStore(BuildContext context) async {
    _setLoading(true); // Set loading to true
    try {
      // Retrieve values from the controllers and selected value
      String homeName = homeNameController.text;
      String homeDescription = homeDescriptionController.text;
      String homeLocation = homeLocationController.text;
      String homeNeed =
          _selectedValue ?? "Default Need"; // Provide default value if null
      List<String> imageUrls = await uploadImages(homeName, context);
      String? pdfUrl = await uploadPdf(
        homeName,
        context,
      ); // Upload PDF

      // Create a HomeModel instance
      HomeModel newHome = HomeModel(
        homeName: homeName,
        homeDescription: homeDescription,
        homeLocation: homeLocation,
        homeNeed: homeNeed,
        images: imageUrls,
        pdfUrl: pdfUrl,
      );

      // Add the home data to Firestore
      await _firestore.collection('homes').add(newHome.toMap());

      // Show success message
      ToastHelper.showSuccessToast(
        context: context,
        message: "Home added successfully!",
      );

      // Clear all data after successful addition
      clearData();

      notifyListeners();
    } catch (e) {
      ToastHelper.showErrorToast(
        context: context,
        message: "Failed to add home: $e",
      );
    } finally {
      _setLoading(false); // Set loading to false after operation
    }
  }

  // Clear all data after successful addition
  void clearData() {
    homeNameController.clear();
    homeDescriptionController.clear();
    homeLocationController.clear();
    _selectedValue = null;
    homeImages.clear();
    homePdf = null;
    notifyListeners();
  }
}
