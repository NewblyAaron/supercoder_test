import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/profile/basic_info/basic_info_controller.dart';
import 'package:supercoder_test/app/modules/profile/widgets/profile_text_form_field.dart';
import 'package:supercoder_test/app/utils/app_theme.dart';

class ProfileBasicInfoView extends StatefulWidget {
  const ProfileBasicInfoView({super.key});

  @override
  State<ProfileBasicInfoView> createState() => _ProfileBasicInfoViewState();
}

class _ProfileBasicInfoViewState extends State<ProfileBasicInfoView> {
  final _controller = Get.find<ProfileBasicInfoController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Basic Info",
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
                      label: "Username",
                      enabled: false,
                      controller: TextEditingController(text: "asdf123"),
                    ),
                    ProfileTextFormField(
                      label: "E-mail",
                      keyboardType: TextInputType.emailAddress,
                      validator: _controller.validateEmail,
                    ),
                    _buildPhoneNumberField(),
                    ProfileTextFormField(label: "Nickname"),
                    ProfileTextFormField(label: "Instagram ID"),
                    ProfileTextFormField(
                      label: "Website Link",
                      keyboardType: TextInputType.url,
                    ),
                    _buildPortfolioField(),

                    _buildSubmitButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
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
    );
  }

  Widget _buildPhoneNumberField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: AppTheme.baseTextStyle.copyWith(fontSize: 14),
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ProfileTextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters: [_controller.phoneNumberFormatter],
                validator: _controller.validatePhoneNumber,
                controller: _controller.phoneNumberController,
              ),
            ),
            SizedBox(width: 8),
            Material(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: _controller.verifyPhoneNumber,
                child: Ink(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Verify",
                    style: AppTheme.baseTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildPortfolioField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Portfolio File",
          style: AppTheme.baseTextStyle.copyWith(fontSize: 14),
        ),
        SizedBox(height: 4),
        GestureDetector(
          onTap: _controller.uploadPortfolio,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xffe0e0e0)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              suffixIcon: const Icon(Icons.attach_file_outlined),
            ),
            style: AppTheme.baseTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            ignorePointers: true,
            controller: _controller.portfolioController,
            validator: _controller.validatePortfolio,
          ),
        ),
      ],
    );
  }
}
