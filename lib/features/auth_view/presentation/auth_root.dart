import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../../widgets/my_error_widget.dart';
import '../business/auth_service.dart';
import '../business/auth_state.dart';
import 'auth_view.dart';

class AuthRootView extends ConsumerWidget {
  const AuthRootView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authServiceProvider);
    return switch (authState) {
      AsyncData(:final AuthState value) => switch (value) {
          LoggedCompany() || LoggedJobSeeker() => const LoggedRoot(),
          Unauthenticated() => const AuthView(),
          AuthState() => throw UnimplementedError(),
        },
      AsyncError(:final error) => MyErrorWidget(error),
      _ => const CircularProgressIndicator(),
    };
  }
}
