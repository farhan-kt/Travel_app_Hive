import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/helper/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final IconData suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final int? maxLength;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.suffixIcon,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: [
        if (widget.maxLength != null)
          LengthLimitingTextInputFormatter(widget.maxLength),
        ...?widget.inputFormatters,
      ],
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: widget.labelText,
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
          widget.suffixIcon,
        ),
      ),
    );
  }
}
