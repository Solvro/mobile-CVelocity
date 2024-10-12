import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/my_outlined_button.dart';
import '../../../../widgets/my_text_button.dart';
import '../../../../widgets/my_text_field.dart';
import '../../../api_base/error_response_model.dart';
import '../../../api_base/wrap_with_error.dart';
import '../../business/auth_service.dart';
import '../../data/models/register_post_model.dart';
import '../models/register_form_model.dart';

class RegisterWidget extends HookWidget {
  const RegisterWidget(this.toggleIsRegistering, {super.key});
  final bool Function() toggleIsRegistering;
  @override
  Widget build(BuildContext context) {
    final isError = useState<ErrorResponseModel?>(null);
    final hasError = isError.value != null;
    final isLoading = useState(false);
    return RegisterFormModelFormBuilder(
      model: const RegisterFormModel(),
      builder: (context, formModel, child) => Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rejestracja',
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
              MyTextField(
                formControl: formModel.passwordConfirmationControl,
                labelText: "Powtórz hasło",
                hintText: "Powtórz swoje hasło",
                textStyle: context.textTheme.smallText,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              _NameField(formModel),
              ReactiveCheckboxListTile(
                formControl: formModel.isCompanyControl,
                title: Text(
                  "Czy jesteś firmą?",
                  style: context.textTheme.title,
                ),
              ),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) => isLoading.value
                    ? const CircularProgressIndicator()
                    : MyOutlinedButton(
                        onPressed: () async {
                          if (formModel.form.valid) {
                            isLoading.value = true;
                            final response = await ref
                                .read(authServiceProvider.notifier)
                                .register(
                                  RegisterPostModel(
                                    email: formModel.emailControl!.value!,
                                    password: formModel.passwordControl!.value!,
                                    passwordConfirmation: formModel
                                        .passwordConfirmationControl!.value!,
                                    isCompany:
                                        formModel.isCompanyControl.value!,
                                    fullName: formModel.fullNameControl!.value!,
                                  ),
                                );
                            isLoading.value = false;
                            if (response.isError) {
                              isError.value = response.right;
                            }
                          } else {
                            formModel.form.markAllAsTouched();
                          }
                        },
                        text: 'Zarejestruj się'),
              ),
              const SizedBox(height: 20),
              MyTextButton(
                onPressed: toggleIsRegistering,
                text: "Masz już konto? Zaloguj się",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NameField extends HookWidget {
  const _NameField(
    this.formModel,
  );
  final RegisterFormModelForm formModel;
  @override
  Widget build(BuildContext context) {
    final isCompanyControlAsync =
        useStream(formModel.isCompanyControl.valueChanges);
    final isCompany = isCompanyControlAsync.data ?? false;
    return MyTextField(
      formControl: formModel.fullNameControl,
      labelText: (!isCompany) ? "Pełna imię i nazwisko" : "Pełna nazwa firmy",
      hintText: (!isCompany) ? "Wpisz imię i nazwisko" : "Pełna nazwę firmy",
      textStyle: context.textTheme.smallText,
      obscureText: false,
    );
  }
}
