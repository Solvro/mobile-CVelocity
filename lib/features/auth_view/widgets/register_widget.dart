import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../../widgets/my_outlined_button.dart';
import '../../../widgets/my_text_button.dart';
import '../../../widgets/my_text_field.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget(this.toggleIsRegistering, {super.key});
  final bool Function() toggleIsRegistering;
  @override
  Widget build(BuildContext context) {
    return Center(
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
            MyOutlinedButton(onPressed: () {}, text: 'Register'),
            const SizedBox(height: 20),
            MyTextButton(
              onPressed: toggleIsRegistering,
              text: "Don't have an account? Register",
            )
          ],
        ),
      ),
    );
  }
}
