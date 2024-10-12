import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/my_outlined_button.dart';
import '../../../../widgets/my_text_button.dart';
import '../../../../widgets/my_text_field.dart';
import '../../../api_base/error_response_model.dart';
import '../../../api_base/wrap_with_error.dart';
import '../../business/auth_service.dart';
import '../../data/models/login_post_model.dart';
import '../models/login_form_model.dart';

class LoginWidget extends HookWidget {
  const LoginWidget(this.toggleIsRegistering, {super.key});
  final bool Function() toggleIsRegistering;
  @override
  Widget build(BuildContext context) {
    final isError = useState<ErrorResponseModel?>(null);
    final hasError = isError.value != null;
    final isLoading = useState(false);
    return LoginFormModelFormBuilder(
      model: const LoginFormModel(),
      builder: (context, formModel, child) => Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Logowanie',
                style: hasError
                    ? context.textTheme.largeHeadline
                        .copyWith(color: Theme.of(context).colorScheme.error)
                    : context.textTheme.largeHeadline,
              ),
              if (hasError)
                Text(
                  isError.value!.error,
                  style: context.textTheme.title
                      .copyWith(color: Theme.of(context).colorScheme.error),
                ),
              const SizedBox(height: 35),
              MyTextField(
                formControl: formModel.emailControl,
                labelText: "Email",
                hintText: "Wpisz swój email",
                textStyle: context.textTheme.smallText,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              MyTextField(
                formControl: formModel.passwordControl,
                labelText: "Hasło",
                hintText: "Wpisz swoje hasło",
                textStyle: context.textTheme.smallText,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              isLoading.value
                  ? const CircularProgressIndicator()
                  : Consumer(
                      builder: (context, ref, child) => MyOutlinedButton(
                        onPressed: () async {
                          if (formModel.form.valid) {
                            isLoading.value = true;
                            final response = await ref
                                .read(authServiceProvider.notifier)
                                .login(
                                  LoginPostModel(
                                    email: formModel.emailControl!.value!,
                                    password: formModel.passwordControl!.value!,
                                  ),
                                )
                                .wrapWithError();
                            isLoading.value = false;
                            if (response.isError) {
                              isError.value = response.right;
                            }
                          } else {
                            formModel.form.markAllAsTouched();
                          }
                        },
                        text: 'Zaloguj',
                      ),
                    ),
              const SizedBox(height: 20),
              MyTextButton(
                onPressed: toggleIsRegistering,
                text: "Nie masz jeszcze konta? Zarejestruj się",
              )
            ],
          ),
        ),
      ),
    );
  }
}
