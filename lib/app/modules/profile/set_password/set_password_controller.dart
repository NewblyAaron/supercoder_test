import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileSetPasswordController extends RxController {
  final formKey = GlobalKey<FormState>();

  var oldPass = ''.obs, newPass = ''.obs, confirmPass = ''.obs;

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }

    if (value.length < 8) {
      return 'Password too short';
    }

    if (value.length > 16) {
      return 'Password too long';
    }

    final regex = RegExp(r"^[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{}|;:',.<>?/]+$");
    if (!regex.hasMatch(value)) {
      return 'Invalid password';
    }

    return null;
  }

  String? validateNewPassword(String? value) {
    final passwordError = validatePassword(value);
    if (passwordError != null) return passwordError;

    if (value != newPass.value) {
      return 'Passwords do not match';
    }

    return null;
  }

  void submit() {
    print('$oldPass\n$newPass\n$confirmPass');

    if (formKey.currentState?.validate() == true) {
      if (oldPass.value == '1q2w3e4r!@') {
        Get.snackbar("Password changed", "Password successfully changed");
      } else {
        Get.snackbar("Change password error", "Incorrect old password");
      }
    }
  }
}
