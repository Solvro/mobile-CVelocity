import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../theme/app_theme.dart';
import 'widgets/login_widget.dart';
import 'widgets/register_widget.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.onyx,
      body: HookBuilder(builder: (context) {
        final isRegistering = useState(false);
        toggleIsRegistering() => isRegistering.value = !isRegistering.value;
        if (isRegistering.value) {
          return RegisterWidget(toggleIsRegistering);
        }
        return LoginWidget(toggleIsRegistering);
      }),
    );
  }
}
