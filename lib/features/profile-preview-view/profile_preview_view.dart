import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/logo_app_bar.dart';
import '../../widgets/profile_avatar.dart';
import 'models/experience.dart';
import 'widgets/exp_card.dart';
import 'widgets/header.dart';

class ProfilePreviewView extends StatelessWidget {
  const ProfilePreviewView({super.key});
  final String title = 'Janusz Kowalinski';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colorTheme.onyx,
        body: CustomScrollView(slivers: [
          SliverAppBar.large(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: context.colorTheme.onyx,
            title: Text(
              title,
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
                    'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
                  ),
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
            actions: const [
              ProfileAvatar(),
            ],
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
                          'Janusz Kowalinski',
                          style:
                              context.textTheme.headline.copyWith(fontSize: 24),
                        ),
                        subtitle: Text(
                          'Flutter Developer',
                          style: context.textTheme.title.copyWith(
                            color: context.colorTheme.lightGrey,
                          ),
                        ),
                      ),
                    ),
                    const Header("Doświadczenie"),
                    const ExpCard(Experience(
                      jobTitle: 'Flutter Developer',
                      company: 'Google',
                      experience: 2,
                    )),
                    const ExpCard(Experience(
                      jobTitle: 'Dart Developer',
                      company: 'Google',
                      experience: 2,
                    )),
                    const ExpCard(Experience(
                      jobTitle: 'Android Developer',
                      company: 'Google',
                      experience: 2,
                    )),
                    const Header("Edukacja"),
                    const ExpCard(Experience(
                      jobTitle: 'Informatyka',
                      company: 'Politechnika Warszawska',
                      experience: 5,
                    )),
                    const ExpCard(Experience(
                      jobTitle: 'Informatyka',
                      company: 'Politechnika Warszawska',
                      experience: 5,
                    )),
                    const ExpCard(Experience(
                      jobTitle: 'Informatyka',
                      company: 'Politechnika Warszawska',
                      experience: 5,
                    )),
                    const Header("Umiejętności"),
                    const ExpCard(Experience(
                      jobTitle: 'Flutter',
                      company: 'Google',
                      experience: 2,
                    )),
                    const ExpCard(Experience(
                      jobTitle: 'Dart',
                      company: 'Google',
                      experience: 2,
                    )),
                    const ExpCard(Experience(
                      jobTitle: 'Android',
                      company: 'Google',
                      experience: 2,
                    )),
                  ]),
                ),
              ),
            ),
          ))
        ]));
  }
}
