import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/helper/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final int? maxLength;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: [
        if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
        ...?inputFormatters,
      ],
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: GreenColor.green),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: GreenColor.green),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: GreenColor.green),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: GreenColor.green),
        ),
        suffixIcon: Icon(
          suffixIcon,
        ),
      ),
    );
  }
}
