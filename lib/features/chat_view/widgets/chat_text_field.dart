import 'package:cvelocity/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChatTextField extends HookWidget {
  const ChatTextField({super.key, required this.textController, required this.hintText, required this.textStyle, required this.onTap});

  final TextEditingController textController;
  final String hintText;
  final TextStyle textStyle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {


    return TextField(
      controller: textController,
      style: textStyle,
      cursorColor: context.colorTheme.onyx,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
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
        suffixIcon: IconButton(onPressed: onTap, icon: const Icon(Icons.send)),
      ),
    );
  }
}