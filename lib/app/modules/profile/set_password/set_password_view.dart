import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/profile/set_password/set_password_controller.dart';
import 'package:supercoder_test/app/modules/profile/widgets/profile_text_form_field.dart';
import 'package:supercoder_test/app/utils/app_theme.dart';

class ProfileSetPasswordView extends StatefulWidget {
  const ProfileSetPasswordView({super.key});

  @override
  State<ProfileSetPasswordView> createState() => _ProfileSetPasswordViewState();
}

class _ProfileSetPasswordViewState extends State<ProfileSetPasswordView> {
  final _controller = Get.find<ProfileSetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Set Password",
                  textAlign: TextAlign.left,
                  style: AppTheme.baseTextStyle.copyWith(fontSize: 28),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    ProfileTextFormField(
                      label: "Old password",
                      hintText: "Enter old password",
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: _controller.validatePassword,
                      onChanged: (value) => _controller.oldPass.value = value,
                    ),
                    ProfileTextFormField(
                      label: "New password",
                      hintText: "8 to 16; alphanumeric and special characters",
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) => _controller.newPass.value = value,
                      validator: _controller.validateNewPassword,
                    ),
                    ProfileTextFormField(
                      label: "Confirm password",
                      hintText: "Re-enter new password",
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) =>
                          _controller.confirmPass.value = value,
                      validator: _controller.validateNewPassword,
                    ),
                  ],
                ),
              ),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: _controller.submit,
                child: Ink(
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: AppTheme.baseTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
