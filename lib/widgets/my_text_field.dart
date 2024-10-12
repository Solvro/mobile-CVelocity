import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../theme/app_theme.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.formControl,
    required this.labelText,
    required this.hintText,
    required this.textStyle,
    required this.obscureText,
  });

  final FormControl? formControl;
  final String labelText;
  final String hintText;
  final TextStyle textStyle;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControl: formControl,
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
