import 'package:flutter/material.dart';

class CheckoutTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final AutovalidateMode autovalidateMode;

  const CheckoutTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        autovalidateMode: autovalidateMode,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your $labelText';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
