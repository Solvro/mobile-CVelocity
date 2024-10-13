import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../theme/app_theme.dart';
import '../../widgets/my_error_widget.dart';
import '../../widgets/my_outlined_button.dart';
import '../api_base/error_response_model.dart';
import '../api_base/wrap_with_error.dart';
import '../profile-preview-view/models/cv.dart';
import '../profile-preview-view/widgets/header.dart';
import '../profile-preview-view/widgets/tag.dart';
import '../profile-preview-view/widgets/tile_wrap.dart';
import '../skills/skill_model.dart';
import '../skills/skill_repo.dart';
import '../tags/tag_model.dart';
import '../tags/tags_repo.dart';
import 'data/cv_repo.dart';
import 'models/cv_form_model.dart';
import 'widgets/cupertino_picker.dart';
import 'widgets/education.dart';
import 'widgets/experience.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.cv});
  final Cv cv;

  @override
  Widget build(BuildContext context) {
    return CvFormFormBuilder(
      model: CvForm(
        fullName: cv.fullName,
        title: cv.title,
        description: cv.description,
        tags: cv.tags,
        // skills: cv.skills,
        experience: cv.experience
            .map(
              (e) => ExperienceForm(
                company: e.company,
                position: e.position,
                duration: e.duration,
              ),
            )
            .toList(),
        education: cv.education
            .map(
              (e) => EducationForm(
                degree: e.degree,
                institution: e.institution,
                year: e.year,
              ),
            )
            .toList(),
        skills: cv.skills,
        isRemote: cv.isRemote,
        searchRange: cv.searchRange,
        phoneNumber: cv.phoneNumber,
        photo: cv.photo,
      ),
      builder: (context, formModel, child) => Scaffold(
          backgroundColor: context.colorTheme.onyx,
          body: HookBuilder(builder: (context) {
            final isError = useState<ErrorResponseModel?>(null);
            final hasError = isError.value != null;
            final isLoading = useState(false);
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    icon: Icon(
                      Platform.isIOS
                          ? Icons.arrow_back_ios_new_sharp
                          : Icons.arrow_back,
                      color: context.colorTheme.lightGrey,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  expandedHeight: 100.0,
                  pinned: true,
                  backgroundColor: context.colorTheme.onyx,
                  scrolledUnderElevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    title: const Text(
                      'Wypełnij swoje CV',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    background: Container(
                      color: context.colorTheme.onyx,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Dane personalne:',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                if (hasError)
                  SliverToBoxAdapter(
                    child: Text(
                      isError.value!.error,
                      style: context.textTheme.title
                          .copyWith(color: Theme.of(context).colorScheme.error),
                    ),
                  ),
                InputThings(
                  label: 'Imię',
                  controller: Left(formModel.fullNameControl),
                ),
                InputThings(
                  label: 'Tytuł',
                  controller: Left(formModel.titleControl),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Container(
                        color: context.colorTheme.onyx,
                        child: Column(children: [
                          ReactiveFormArray(
                            formArray: formModel.tagsControl,
                            builder: (context, formArray, child) {
                              return TileWrap(
                                title: "Tagi",
                                children: [
                                  ...formModel.tagsControl.value?.map(
                                        (e) => MyTag(e?.tag ?? ""),
                                      ) ??
                                      [],
                                  AddTagBtn(formModel),
                                ],
                              );
                            },
                          ),
                          ListTile(
                              title: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Opis",
                                  style: context.textTheme.headline,
                                ),
                              ),
                              subtitle: ReactiveTextField(
                                formControl: formModel.descriptionControl,
                                maxLines: null,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  hintText: 'Wprowadź opis...',
                                  hintStyle: TextStyle(
                                    color: context.colorTheme.lightGrey,
                                  ),
                                ),
                              )),
                          ReactiveFormArray(
                            formArray: formModel.skillsControl,
                            builder: (context, formArray, child) {
                              return TileWrap(
                                title: "Umiejętności",
                                children: [
                                  ...formModel.skillsControl.value?.map(
                                        (e) => MyTag(e?.skill ?? ""),
                                      ) ??
                                      [],
                                  AddSkillBtn(formModel),
                                ],
                              );
                            },
                          ),
                          ReactiveCheckboxListTile(
                            formControl: formModel.isRemoteControl,
                            title: Text('Praca zdalna',
                                style: context.textTheme.title.copyWith(
                                  color: Colors.white,
                                )),
                            activeColor: context.colorTheme.russianViolet,
                          ),
                          InputThings(
                            silverWrap: false,
                            label: 'Zasięg wyszukiwania',
                            controller: Left(formModel.searchRangeControl),
                          ),
                          InputThings(
                            silverWrap: false,
                            label: 'Numer telefonu',
                            controller: Left(formModel.phoneNumberControl),
                          ),
                          InputThings(
                            silverWrap: false,
                            controller: Left(formModel.photoControl),
                            label: 'Zdjęcie URL',
                          ),
                          const Header("Doświadczenie"),
                          ExperienceInputs(formModel),
                          const Header("Edukacja"),
                          EducationInputs(formModel),
                        ]),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Consumer(
                    builder: (context, ref, child) => isLoading.value
                        ? const CircularProgressIndicator()
                        : MyOutlinedButton(
                            onPressed: () async {
                              if (formModel.form.valid) {
                                isLoading.value = true;
                                final response = await ref
                                    .read(cvRepositoryProvider.notifier)
                                    .putCv(Cv(
                                      id: null,
                                      userId: cv.userId,
                                      tags: (formModel.tagsControl.value ?? [])
                                          .map(
                                            (e) => Tag(
                                              tag: e!.tag,
                                            ),
                                          )
                                          .toList(),
                                      skills:
                                          (formModel.skillsControl.value ?? [])
                                              .map(
                                                (e) => Skill(
                                                  skill: e!.skill,
                                                ),
                                              )
                                              .toList(),
                                      title: formModel.titleControl!.value,
                                      description:
                                          formModel.descriptionControl!.value,
                                      experience:
                                          (formModel.experienceControl.value ??
                                                  [])
                                              .map(
                                                (e) => Experience.fromJson(e!),
                                              )
                                              .toList(),
                                      education:
                                          (formModel.educationControl.value ??
                                                  [])
                                              .map(
                                                (e) => Education.fromJson(e!),
                                              )
                                              .toList(),
                                      createdAt: null,
                                      updatedAt: null,
                                      fullName: null,
                                      isRemote:
                                          formModel.isRemoteControl!.value,
                                      phoneNumber:
                                          formModel.phoneNumberControl!.value,
                                      searchRange:
                                          formModel.searchRangeControl!.value,
                                      photo: formModel.photoControl!.value,
                                    ))
                                    .wrapWithError();
                                isLoading.value = false;
                                if (response.isError) {
                                  isError.value = response.right;
                                }
                              } else {
                                Logger().e('Form is invalid');
                                Logger().e(formModel.form.errors);
                                formModel.form.markAllAsTouched();
                              }
                            },
                            text: 'ZAPISZ',
                          ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 150,
                  ),
                ),
              ],
            );
          })),
    );
  }
}

class AddSkillBtn extends HookConsumerWidget {
  const AddSkillBtn(
    this.formModel, {
    super.key,
  });

  final CvFormForm formModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skills = ref.watch(skillRepositoryProvider);
    return switch (skills) {
      AsyncData(:final List<Skill> value) => IconButton(
          onPressed: () async {
            final string = await showMyCupertinoDialog(
              context: context,
              onSelectedItemChanged: (int index) {},
              strings: value.map((e) => e.skill).toList(),
            );
            final skill =
                value.firstWhere((element) => element.skill == string);
            formModel.addSkillsItem(skill);
          },
          icon: const Icon(Icons.add),
        ),
      AsyncError(:final Object error) => MyErrorWidget(error),
      _ => const SizedBox(),
    };
  }
}

class AddTagBtn extends HookConsumerWidget {
  const AddTagBtn(
    this.formModel, {
    super.key,
  });

  final CvFormForm formModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(tagsRepositoryProvider);
    return switch (tags) {
      AsyncData(:final List<Tag> value) => IconButton(
          onPressed: () async {
            final string = await showMyCupertinoDialog(
              context: context,
              onSelectedItemChanged: (int index) {},
              strings: value.map((e) => e.tag).toList(),
            );
            final tag = value.firstWhere((element) => element.tag == string);
            formModel.addTagsItem(tag);
          },
          icon: const Icon(Icons.add),
        ),
      AsyncError(:final Object error) => MyErrorWidget(error),
      _ => const SizedBox(),
    };
  }
}

class InputThings extends StatelessWidget {
  const InputThings(
      {super.key,
      required this.label,
      required this.controller,
      this.silverWrap = true});
  final String label;
  final Either<FormControl?, String> controller;
  final bool silverWrap;

  @override
  Widget build(BuildContext context) {
    if (silverWrap) {
      return SliverToBoxAdapter(
        child: _Input(controller: controller, label: label),
      );
    }
    return _Input(controller: controller, label: label);
  }
}

class _Input extends StatelessWidget {
  const _Input({
    required this.controller,
    required this.label,
  });

  final Either<FormControl?, String> controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: ReactiveTextField(
        formControl: controller.isLeft ? controller.left : null,
        formControlName: controller.isRight ? controller.right : null,
        maxLines: null,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
