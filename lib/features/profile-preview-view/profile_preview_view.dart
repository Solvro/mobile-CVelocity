import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/logo_app_bar.dart';
import '../../widgets/profile_avatar.dart';

class ProfilePreviewView extends StatelessWidget {
  const ProfilePreviewView({super.key});
  final String title = 'Janusz Kowalinski';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(title),
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
        SliverList(
          delegate: SliverChildListDelegate([
            Text(
              "Szymon Kowaliński",
              style: context.textTheme.headline,
            ),
            Text(
              "Flutter developer",
              style: context.textTheme.headline,
            ),
            const ExpansionTile(
              title: Text("Doswiadczenie"),
              children: [
                Card(
                  child: ListTile(
                    title: Text("Flutter Techlead"),
                    subtitle: Text("KN Solvro"),
                    trailing: Text("6yrs"),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text("Wiceprezes"),
                    subtitle: Text("KN Solvro"),
                    trailing: Text("5yrs"),
                  ),
                )
              ],
            ),
          ]),
        )
      ],
    ));
  }
}
