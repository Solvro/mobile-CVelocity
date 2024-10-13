import 'package:collection/collection.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../../theme/app_theme.dart';
import '../../../widgets/my_text_button.dart';
import '../models/cv_form_model.dart';
import '../settings_view.dart';

class ExperienceInputs extends StatelessWidget {
  const ExperienceInputs(
    this.formModel, {
    super.key,
  });
  final CvFormForm formModel;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormArray(
      formArray: formModel.experienceControl,
      builder: (context, formArray, child) {
        return Column(
          children: [
            ...formModel.experienceExperienceFormForm.mapIndexed(
              (index, model) {
                return Card(
                  color: context.colorTheme.jet,
                  child: Column(
                    children: [
                      ListTile(
                        title: InputThings(
                          silverWrap: false,
                          label: 'Firma',
                          controller: Left(model.companyControl),
                        ),
                      ),
                      ListTile(
                        title: InputThings(
                          silverWrap: false,
                          label: 'Stanowisko',
                          controller: Left(model.positionControl),
                        ),
                      ),
                      ListTile(
                        title: InputThings(
                          silverWrap: false,
                          label: 'Czas trwania',
                          controller: Left(model.durationControl),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: MyTextButton(
                onPressed: () {
                  formModel.addExperienceItem(
                    const ExperienceForm(
                      company: null,
                      position: null,
                      duration: null,
                    ),
                  );
                },
                text: 'Dodaj',
              ),
            ),
          ],
        );
      },
    );
  }
}
