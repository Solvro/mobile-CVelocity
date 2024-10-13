import 'package:collection/collection.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../../theme/app_theme.dart';
import '../../../widgets/my_text_button.dart';
import '../models/cv_form_model.dart';
import '../settings_view.dart';

class EducationInputs extends StatelessWidget {
  const EducationInputs(
    this.formModel, {
    super.key,
  });
  final CvFormForm formModel;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormArray(
      formArray: formModel.educationControl,
      builder: (context, formArray, child) {
        return Column(
          children: [
            ...formModel.educationEducationFormForm.mapIndexed(
              (index, model) {
                return Card(
                  color: context.colorTheme.jet,
                  child: Column(
                    children: [
                      ListTile(
                        title: InputThings(
                          silverWrap: false,
                          label: 'Tytuł',
                          controller: Left(model.degreeControl),
                        ),
                      ),
                      ListTile(
                        title: InputThings(
                          silverWrap: false,
                          label: 'Instytucja',
                          controller: Left(model.institutionControl),
                        ),
                      ),
                      ListTile(
                        title: InputThings(
                          silverWrap: false,
                          label: 'Lata',
                          controller: Left(model.yearControl),
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
                  formModel.addEducationItem(
                    const EducationForm(
                      institution: null,
                      year: null,
                      degree: null,
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
