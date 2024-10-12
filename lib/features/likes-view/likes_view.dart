import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/logo_app_bar.dart';
import '../../widgets/tile_splash.dart';

class LikesView extends StatelessWidget {
  const LikesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.onyx,
      appBar: LogoAppBar(context),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                180, // Maximum width of a grid item  // Aspect ratio of each grid item (width / height)
            crossAxisSpacing: 10, // Spacing between items along the cross-axis
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) => _UserCard(
                index: index,
              ),
          itemCount: 20,
          padding: const EdgeInsets.all(10)),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child:
          Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
        Container(
          color: context.colorTheme.jet,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: const Image(
                      image: NetworkImage(
                          'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4'),
                      width: 100,
                      height: 100,
                    )),
                const SizedBox(height: 10),
                Text(
                  'User $index',
                  style: context.textTheme.smallText,
                ),
              ],
            ),
          ),
        ),
        TileSplash(onTap: () {}),
      ]),
    );
  }
}
