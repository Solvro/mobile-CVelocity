import 'package:cvelocity/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.textController,
      required this.labelText,
      required this.hintText,
      required this.textStyle,
      required this.obscureText});

  final TextEditingController textController;
  final String labelText;
  final String hintText;
  final TextStyle textStyle;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: textStyle,
      cursorColor: context.colorTheme.onyx,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: context.colorTheme.lightGrey,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: context.colorTheme.lightGrey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colorTheme.onyx,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colorTheme.jet,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colorTheme.onyx,
          ),
        ),
        filled: true,
        fillColor: context.colorTheme.jet,
      ),
    );
  }
}
