import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/profile/basic_info/auth_code_dialog.dart';
import 'package:supercoder_test/app/services/android_file_service.dart';

class ProfileBasicInfoController extends RxController {
  final formKey = GlobalKey<FormState>();

  final portfolioController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool isPhoneNumberVerified = false;

  TextInputFormatter
  get phoneNumberFormatter => TextInputFormatter.withFunction((
    oldValue,
    newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    String newText = digits;

    if (digits.length > 3 && digits.length <= 7) {
      newText = "${digits.substring(0, 3)}-${digits.substring(3)}";
    } else if (digits.length > 7) {
      newText =
          "${digits.substring(0, 3)}-${digits.substring(3, 7)}-${digits.substring(7, digits.length)}";
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  });

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final isEmail = EmailValidator.validate(value);
    if (!isEmail) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    final regex = RegExp(r'^010-\d{4}-\d{4}$');
    if (!regex.hasMatch(value)) {
      return 'Enter phone number as 010-1234-1234';
    }

    if (!isPhoneNumberVerified) {
      return 'Please verify your phone number';
    }

    return null;
  }

  String? validatePortfolio(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please upload your portfolio';
    }

    return null;
  }

  void uploadPortfolio() async {
    final result = await AndroidFileService.pickPdf();

    if (result != null) {
      final filename = await AndroidFileService.getFileName(result);
      portfolioController.value = TextEditingValue(text: filename ?? '');
    }
  }

  void verifyPhoneNumber() async {
    if (phoneNumberController.value.text.isEmpty) {
      Get.snackbar("Input error", "Please enter a phone number.");
      return;
    }

    final controller = TextEditingController();
    final result = await Get.dialog<bool>(
      AuthCodeDialog(controller: controller),
    );

    if (result == true) {
      Get.snackbar("Verification successful", "Phone number verified!");
      isPhoneNumberVerified = true;
    } else {
      Get.snackbar("Verification failed", "Failed to verify phone number.");
      isPhoneNumberVerified = false;
    }
  }

  void submit() {
    formKey.currentState?.validate();
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    portfolioController.dispose();
    super.onClose();
  }
}
