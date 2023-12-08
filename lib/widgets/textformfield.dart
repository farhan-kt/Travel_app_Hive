import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final IconData suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final int? maxLength;

  CustomTextFormField({
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
        labelStyle: const TextStyle(color: Color(0xFF355952)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF355952)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF355952)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF355952)),
        ),
        suffixIcon: Icon(
          widget.suffixIcon,
          color: Colors.black,
        ),
      ),
    );
  }
}
