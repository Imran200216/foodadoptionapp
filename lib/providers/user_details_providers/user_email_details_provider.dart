import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/helpers/toast_helper.dart';
import 'package:foodadoptionapp/modals/user_modal.dart';
import 'package:foodadoptionapp/screens/bottom_nav.dart';
import 'package:foodadoptionapp/screens/nick_name_screens/email_user_nick_name_screen.dart';
import 'package:foodadoptionapp/services/avatar_service.dart';

class UserEmailDetailsProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<UserModal> _emailUsers = [];

  List<UserModal> get emailUsers => _emailUsers;

  String _avatarPhotoURL = '';
  String _nickName = '';
  String _decodedFluttermojiValue = ''; // New property for decoded value

  String get avatarPhotoURL => _avatarPhotoURL;

  String get nickName => _nickName;

  String get decodedFluttermojiValue =>
      _decodedFluttermojiValue; // Getter for decoded value

  set avatarPhotoURL(String url) {
    _avatarPhotoURL = url;
    notifyListeners();
  }

  set nickName(String name) {
    _nickName = name;
    notifyListeners();
  }

  /// Save avatar functionality
  Future<void> saveUserAvatarForEmailAuth(
      String userId, BuildContext context) async {
    _setLoading(true);
    try {
      String avatarData = await encodeMyJSON();

      await _firestore.collection('userByEmailAuth').doc(userId).update({
        'avatarPhotoURL': avatarData,
      });

      avatarPhotoURL = avatarData;

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return EmailUserNickNameScreen(userId: userId);
      }));

      ToastHelper.showSuccessToast(
        context: context,
        message: "Avatar added successfully",
      );
    } catch (e) {
      print("Error saving avatar: $e");
      ToastHelper.showErrorToast(
        context: context,
        message: "Avatar not added!",
      );
    } finally {
      _setLoading(false);
    }
  }

  final TextEditingController nickNameController = TextEditingController();

  /// Update the nickname functionality
  Future<void> updateNickname(String userId, BuildContext context) async {
    _setLoading(true);

    // Check if the nickname is empty before proceeding
    if (nickNameController.text.trim().isEmpty) {
      ToastHelper.showErrorToast(
        context: context,
        message:
        "Nickname cannot be empty!", // Toast message for empty nickname
      );
      _setLoading(false); // Ensure loading state is reset
      return; // Exit the function if nickname is empty
    }

    try {
      await _firestore.collection('userByEmailAuth').doc(userId).update({
        'nickName': nickNameController.text.trim(),
      });

      nickName = nickNameController.text.trim(); // Update the local variable

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const BottomNav();
      }));

      ToastHelper.showSuccessToast(
        context: context,
        message: "Nickname updated successfully",
      );
    } catch (e) {
      print("Error updating nickname: $e");
      ToastHelper.showErrorToast(
        context: context,
        message: "Nickname not updated!",
      );
    } finally {
      _setLoading(false); // Ensure loading state is reset
    }
  }

  /// Fetching the user details
  Future<void> fetchEmailUserDetails(BuildContext context) async {
    _setLoading(true);
    try {
      QuerySnapshot querySnapshot =
      await _firestore.collection('userByGoogleAuth').get();
      _emailUsers = querySnapshot.docs.map((doc) {
        return UserModal.fromJson({
          'uid': doc.id,
          ...doc.data() as Map<String, dynamic>,
        });
      }).toList();
      notifyListeners(); // Notify listeners of data update

      // Access the avatar photo URL from the user
      for (var user in _emailUsers) {
        String avatarData =
            user.avatarPhotoURL ?? ''; // Retrieve the avatar data
        if (avatarData.isNotEmpty) {
          // Decode and save the avatar data as needed
          _decodedFluttermojiValue = decodeFluttermojifromString(avatarData);

          // Print the decoded SVG string for verification
          print("Decoded Fluttermoji SVG: $_decodedFluttermojiValue");
        }
      }
    } catch (e) {
      print("Error fetching user details: $e");
      ToastHelper.showErrorToast(
        context: context,
        message: "Failed to fetch users.",
      );
    } finally {
      _setLoading(false);
    }
  }

  String decodeFluttermojifromString(String encodedData) {
    try {
      // Decode the base64 encoded data into bytes
      final decodedBytes = base64Decode(encodedData);

      // Convert the bytes to a string which represents the SVG data
      final svgString = utf8.decode(decodedBytes);

      return svgString; // This is the decoded SVG string
    } catch (e) {
      print("Error decoding Fluttermoji SVG: $e");
      return ''; // Return an empty string if decoding fails
    }
  }
}
