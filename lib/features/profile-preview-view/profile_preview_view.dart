import 'dart:io';

import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/logo_app_bar.dart';
import '../../widgets/profile_avatar.dart';
import 'models/cv.dart';
import 'widgets/card.dart';
import 'widgets/desc.dart';
import 'widgets/header.dart';
import 'widgets/tag.dart';
import 'widgets/tile_wrap.dart';

class ProfilePreviewView extends StatelessWidget {
  const ProfilePreviewView(
    this.cv, {
    super.key,
    this.isDetailView = false,
    this.actions = const [ProfileAvatar()],
  });
  final Cv cv;
  final bool isDetailView;

  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colorTheme.onyx,
        body: CustomScrollView(slivers: [
          SliverAppBar.large(
            automaticallyImplyLeading: false,
            leading: isDetailView
                ? IconButton(
                    icon: Icon(
                      Platform.isIOS
                          ? Icons.arrow_back_ios_new_sharp
                          : Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : null,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: context.colorTheme.onyx,
            title: Text(
              cv.fullName,
              style: context.textTheme.headline,
            ),
            centerTitle: false,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    fit: BoxFit.cover,
                    cv.photo,
                  ),
                  if (!isDetailView)
                    Align(
                      alignment: Alignment.topLeft,
                      child: SafeArea(
                        child: SizedBox(
                          height: kToolbarHeight,
                          child: LogoAppBar(context, implyActions: false),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            actions: actions,
          ),
          SliverToBoxAdapter(
              child: Container(
            color: context.colorTheme.jet,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(
                          cv.fullName,
                          style:
                              context.textTheme.headline.copyWith(fontSize: 24),
                        ),
                        subtitle: Text(
                          cv.title,
                          style: context.textTheme.title.copyWith(
                            color: context.colorTheme.lightGrey,
                          ),
                        ),
                      ),
                    ),
                    TileWrap(
                      title: "Tagi",
                      children: [
                        ...cv.tags.map((e) => MyTag(e.tag)),
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
                      subtitle: Desc(cv.description),
                    ),
                    TileWrap(
                      title: 'Umiejętnosci',
                      children: [
                        ...cv.skills.map(
                          (e) => MyTag(e.skill),
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
          ))
        ]));
  }
}
