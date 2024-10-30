import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/helpers/debounce_helper.dart';
import 'package:foodadoptionapp/helpers/toast_helper.dart';

class ForgetPasswordEmailAuthProvider extends ChangeNotifier {
  /// Controller for forget password
  final TextEditingController forgetPasswordEmailController =
  TextEditingController();

  /// Debounce helper
  final DebounceHelper debounceHelper = DebounceHelper();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Reset password functionality
  Future<void> resetPassword(BuildContext context) async {
    _setLoading(true); // Start loading
    try {
      await _auth
          .sendPasswordResetEmail(
          email: forgetPasswordEmailController.text.trim())
          .then((value) {
        forgetPasswordEmailController.clear();

        // Check for debouncing
        if (!debounceHelper.isDebounced()) {
          debounceHelper.activateDebounce(duration: const Duration(seconds: 2));
          ToastHelper.showSuccessToast(
              context: context,
              message: "Password reset link sent! Check your email");
        }

        // Pushing back
        Navigator.pop(context);
      });
    } catch (e) {
      // Check for debouncing for error toast as well
      if (!debounceHelper.isDebounced()) {
        debounceHelper.activateDebounce(duration: const Duration(seconds: 2));
        ToastHelper.showErrorToast(
            context: context,
            message: "Failed to send reset link. Try again later.");
      }
    } finally {
      _setLoading(false); // Stop loading
    }
  }
}
