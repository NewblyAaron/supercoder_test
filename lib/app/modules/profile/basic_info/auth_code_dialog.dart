import 'package:flutter/material.dart';

class AuthCodeDialog extends StatelessWidget {
  final TextEditingController controller;

  const AuthCodeDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enter Authentication Code"),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: "6-digit code"),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (controller.text == "111005") {
              Navigator.of(context).pop(true);
            } else {
              Navigator.of(context).pop(false);
            }
          },
          child: const Text("Verify"),
        ),
      ],
    );
  }
}
