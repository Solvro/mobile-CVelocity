import 'package:cvelocity/features/auth_view/widgets/my_outlined_button.dart';
import 'package:cvelocity/features/profile-preview-view/widgets/my_text_field.dart';
import 'package:cvelocity/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: context.textTheme.largeHeadline,
              ),
              const SizedBox(height: 35),
              MyTextField(
                textController: TextEditingController(),
                labelText: "Email",
                hintText: "Enter your email",
                textStyle: context.textTheme.smallText,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              MyTextField(
                textController: TextEditingController(),
                labelText: "Password",
                hintText: "Enter your password",
                textStyle: context.textTheme.smallText,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              MyTextField(
                textController: TextEditingController(),
                labelText: "Password",
                hintText: "Repeat your password",
                textStyle: context.textTheme.smallText,
                                obscureText: true,
              ),
              const SizedBox(height: 20),
              MyOutlinedButton(onPressed: (){}, text: 'Register')
            ],
          ),
        ),
      ),
    );
  }
}