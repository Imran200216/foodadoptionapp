import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodadoptionapp/helpers/toast_helper.dart';
import 'package:foodadoptionapp/modals/user_modal.dart';
import 'package:foodadoptionapp/screens/bottom_nav.dart';
import 'package:foodadoptionapp/screens/nick_name_screens/google_user_nick_name_screen.dart';
import 'package:foodadoptionapp/services/avatar_service.dart';

class UserGoogleDetailsProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<UserModal> _guestUsers = [];

  List<UserModal> get guestUsers => _guestUsers;

  // Private fields for avatar URL, nickname, and email address
  String _avatarPhotoURL = '';
  String _nickName = '';

  // Getters for avatarPhotoURL, nickName, and emailAddress
  String get avatarPhotoURL => _avatarPhotoURL;

  String get nickName => _nickName;

  // Setters for avatarPhotoURL, nickName, and emailAddress
  set avatarPhotoURL(String url) {
    _avatarPhotoURL = url;
    notifyListeners(); // Notify listeners when the value changes
  }

  set nickName(String name) {
    _nickName = name;
    notifyListeners(); // Notify listeners when the value changes
  }

  /// Saves the Flutter emoji avatar data for Google-authenticated users
  Future<void> saveUserAvatarForGoogleAuth(
      String userId, BuildContext context) async {
    _setLoading(true);
    try {
      // Encode the Fluttermoji attributes to JSON string
      String avatarData = await encodeMyJSON();

      // Save the avatar data to Firestore
      await _firestore.collection('userByGoogleAuth').doc(userId).update({
        'avatarPhotoURL': avatarData,
      });

      // Set the avatarPhotoURL value
      avatarPhotoURL = avatarData;

      // Navigate to the GoogleUserNickNameScreen and pass userId
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return GoogleUserNickNameScreen(userId: userId); // Pass userId here
      }));

      // Show success toast
      ToastHelper.showSuccessToast(
        context: context,
        message: "Avatar added successfully",
      );
    } catch (e) {
      print("Error saving avatar: $e");
      // Show error toast
      ToastHelper.showErrorToast(
        context: context,
        message: "Avatar not added!",
      );
    } finally {
      _setLoading(false);
    }
  }

  // Define the TextEditingController for the nickname
  final TextEditingController nickNameController = TextEditingController();

  /// Updates the nickname for Google-authenticated users
  Future<void> updateNickname(String userId, BuildContext context) async {
    _setLoading(true);
    try {
      // Update the nickname in Firestore
      await _firestore.collection('userByGoogleAuth').doc(userId).update({
        'nickName': nickNameController.text.trim(), // Use the controller's text
      });

      // Set the nickName value
      nickName = nickNameController.text.trim();

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));

      // Show success toast
      ToastHelper.showSuccessToast(
        context: context,
        message: "Nickname updated successfully",
      );
    } catch (e) {
      print("Error updating nickname: $e");
      // Show error toast
      ToastHelper.showErrorToast(
        context: context,
        message: "Nickname not updated!",
      );
    } finally {
      _setLoading(false);
    }
  }

  /// Fetches all user data from the userByGuestAuth collection
  Future<void> fetchGoogleUserDetails(BuildContext context) async {
    _setLoading(true);
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('userByGuestAuth').get();
      _guestUsers = querySnapshot.docs.map((doc) {
        // Fetch user data and set emailAddress
        return UserModal.fromJson({
          'uid': doc.id,
          ...doc.data() as Map<String, dynamic>,
        });
      }).toList();
      notifyListeners(); // Notify listeners of data update
    } catch (e) {
      print("Error fetching guest user details: $e");
      ToastHelper.showErrorToast(
        context: context,
        message: "Failed to fetch guest users.",
      );
    } finally {
      _setLoading(false);
    }
  }
}
