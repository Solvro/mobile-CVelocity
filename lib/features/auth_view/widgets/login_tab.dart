import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadTab(
      value: 'account',
      content: ShadCard(
        title: const Text('Login'),
        description: const Text(
            "Make changes to your account here. Click save when you're done."),
        footer: const ShadButton(child: Text('Save changes')),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            ShadInputFormField(
              label: const Text('Name'),
              initialValue: 'Ale',
            ),
            const SizedBox(height: 8),
            ShadInputFormField(
              label: const Text('Username'),
              initialValue: 'nank1ro',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      child: const Text('Account'),
    );
  }
}