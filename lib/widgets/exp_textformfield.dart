import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/helper/colors.dart';

class ExpField extends StatelessWidget {
  final String labelText;
  final IconData suffixIcon;
  final TextEditingController controller;

  const ExpField({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: 7,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: YellowColor.yellow),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: Colors.white,
          )),
    );
  }
}
