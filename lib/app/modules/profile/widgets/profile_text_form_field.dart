import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercoder_test/app/utils/app_theme.dart';

class ProfileTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool? enabled;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;

  const ProfileTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.enabled,
    this.keyboardType,
    this.validator,
    this.controller,
    this.inputFormatters,
    this.obscureText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label!,
                style: AppTheme.baseTextStyle.copyWith(fontSize: 14),
              ),
              SizedBox(height: 4),
            ],
          ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xffe0e0e0)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            hintText: hintText,
            hintStyle: AppTheme.baseTextStyle.copyWith(
              color: Color(0xffbcbcbc),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: AppTheme.baseTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          obscureText: obscureText ?? false,
          validator: validator,
          enabled: enabled,
          keyboardType: keyboardType,
          onChanged: onChanged,
          controller: controller,
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
