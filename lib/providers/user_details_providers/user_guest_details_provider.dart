import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/helpers/toast_helper.dart';
import 'package:foodadoptionapp/screens/nick_name_screens/guest_user_nick_name_screen.dart';
import 'package:foodadoptionapp/services/avatar_service.dart';

class UserGuestDetailsProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Saves the Fluttermoji avatar data for Guest-authenticated users
  Future<void> saveUserAvatarForGoogleAuth(
      String userId, BuildContext context) async {
    _setLoading(true);
    try {
      // Encode the Fluttermoji attributes to JSON string
      String avatarData = await encodeMyJSON();

      // Save the avatar data to Firestore
      await _firestore.collection('userByAnonymousAuth').doc(userId).update({
        'avatarPhotoURL': avatarData,
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const GuestUserNickNameScreen();
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
}
