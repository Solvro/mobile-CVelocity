import 'package:cvelocity/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.textController, required this.labelText, required this.hintText, required this.textStyle});

  final TextEditingController textController;
  final String labelText;
  final String hintText;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: textStyle,
      cursorColor: context.colorTheme.onyx,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: context.colorTheme.jet,
        ), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colorTheme.jet,
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
            color: context.colorTheme.jet, 
          ),
        ),
        filled: true,
        fillColor: context.colorTheme.lightGrey,
      ),
    );
  }
}