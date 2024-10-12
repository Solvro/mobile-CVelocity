import 'dart:io';

import 'package:cvelocity/features/profile-preview-view/widgets/card.dart';
import 'package:cvelocity/features/profile-preview-view/widgets/desc.dart';
import 'package:cvelocity/features/profile-preview-view/widgets/header.dart';
import 'package:cvelocity/features/profile-preview-view/widgets/tag.dart';
import 'package:cvelocity/features/profile-preview-view/widgets/tile_wrap.dart';
import 'package:cvelocity/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../profile-preview-view/models/cv.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.cv});
  final Cv cv;

  @override
  Widget build(BuildContext context) {
    final TextEditingController descriptionController =
        TextEditingController(text: cv.description);
    final TextEditingController titleController =
        TextEditingController(text: cv.title);
    final TextEditingController fullNameController =
        TextEditingController(text: cv.fullName);
    return Scaffold(
        backgroundColor: context.colorTheme.onyx,
        body: CustomScrollView(slivers: [
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
                'Ustawienia',
                style: TextStyle(color: Colors.white, fontSize: 36),
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
          InputThings(
            label: 'Imię',
            controller: fullNameController,
          ),
          InputThings(
            label: 'Tytuł',
            controller: titleController,
          ),
          SliverToBoxAdapter(
            child: Container(
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
                      TileWrap(
                        title: "Tagi",
                        children: [
                          ...cv.tags.map((e) => MyTag(e.name)),
                        ],
                      ),
                      ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Opis",
                              style: context.textTheme.headline,
                            ),
                          ),
                          subtitle: TextField(
                            controller: descriptionController,
                            maxLines: null,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                hintText: 'Wprowadź opis...',
                                hintStyle: TextStyle(
                                    color: context.colorTheme.lightGrey)),
                          )),
                      TileWrap(
                        title: 'Umiejętnosci',
                        children: [
                          ...cv.skills.map(
                            (e) => MyTag(e.name),
                          ),
                        ],
                      ),
                      const Header("Doświadczenie"),
                      ...cv.experience.map(
                        (e) => ExpCard(e),
                      ),
                      const Header("Edukacja"),
                      ...cv.education.map(
                        (e) => EduCard(e),
                      ),
                      const SizedBox(
                        height: 150,
                      )
                    ]),
                  ),
                ),
              ),
            ),
          )
          //   SliverList(
          //       delegate: SliverChildBuilderDelegate(
          //     (context, index) => ListTile(
          //       title: Text(
          //         'Setting item $index',
          //         style: TextStyle(color: context.colorTheme.lightGrey),
          //       ),
          //     ),
          //     childCount: 20,
          //   ))
          // ],
        ]));
  }
}

class InputThings extends StatelessWidget {
  const InputThings({super.key, required this.label, required this.controller});
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: TextField(
          controller: controller,
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
      ),
    );
  }
}
