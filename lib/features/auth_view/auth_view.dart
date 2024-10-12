import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ShadTabs<String>(
            value: 'account',
            tabBarConstraints: BoxConstraints(maxWidth: 400),
            contentConstraints: BoxConstraints(maxWidth: 400),
            tabs: [
              
              
            ],
          ),
        ),
      ),
    );
  }
}