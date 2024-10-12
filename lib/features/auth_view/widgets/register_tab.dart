import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegisterTab extends StatelessWidget {
  const RegisterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadTab(
    value: 'password',
    content: ShadCard(
      title: const Text('Password'),
      description: const Text(
          "Change your password here. After saving, you'll be logged out."),
      footer: const ShadButton(child: Text('Save password')),
      child: Column(
        children: [
          const SizedBox(height: 16),
          ShadInputFormField(
            label: const Text('Current password'),
            obscureText: true,
          ),
          const SizedBox(height: 8),
          ShadInputFormField(
            label: const Text('New password'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
    child: const Text('Password'),
  );
  }
}