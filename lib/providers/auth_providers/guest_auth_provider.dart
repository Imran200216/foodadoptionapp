import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodadoptionapp/helpers/toast_helper.dart';
import 'package:foodadoptionapp/modals/user_modal.dart';
import 'package:foodadoptionapp/screens/avatar_screens/guest_user_avatar_screen.dart';
import 'package:foodadoptionapp/screens/get_started_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuestAuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  /// Save the guest login state
  Future<void> _saveGuestLoginState(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isGuestLoggedIn', isLoggedIn);
  }

  /// Check if the user is logged in as a guest
  Future<bool> isGuestLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isGuestLoggedIn') ?? false;
  }

  /// sign in with guest functionality
  Future<User?> signInAnonymously(BuildContext context, String userId) async {
    _setLoading(true);
    try {
      // Sign in anonymously
      final UserCredential userCredential = await _auth.signInAnonymously();
      final User? user = userCredential.user;

      if (user != null) {
        // Create a UserModal instance with the user's UID
        UserModal userModal = UserModal(
          uid: user.uid,
        );

        // Store user data in Firestore
        await _firestore
            .collection('userByAnonymousAuth')
            .doc(user.uid)
            .set(userModal.toJson());

        // Save the guest login state
        await _saveGuestLoginState(true);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return GuestUserAvatarScreen(userId: user.uid);
        }));

        // Show success toast
        ToastHelper.showSuccessToast(
          context: context,
          message: "Successfully signed in as Guest",
        );

        return user;
      } else {
        // Show error toast if user is null
        ToastHelper.showErrorToast(
          context: context,
          message: "Guest sign-in failed",
        );
        return null;
      }
    } catch (e) {
      // Show error toast if an exception occurs
      ToastHelper.showErrorToast(
        context: context,
        message: "Anonymous Sign-In error: $e",
      );
      return null;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// sign out with guest functionality
  Future<void> signOut(BuildContext context) async {
    _setLoading(true);
    try {
      User? user = _auth.currentUser;

      // Delete the guest user account
      if (user != null) {
        await user.delete();
      }

      // Clear guest login state
      await _saveGuestLoginState(false);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const GetStartedScreen();
      }));

      ToastHelper.showSuccessToast(
        context: context,
        message: "Successfully signed out from Guest mode",
      );
    } catch (e) {
      ToastHelper.showErrorToast(
        context: context,
        message: "Sign-out failed: $e",
      );
    } finally {
      _setLoading(false);
    }
  }
}
