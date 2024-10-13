import 'package:cvelocity/features/likes-view/likes_mocks.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/blurred_logo_app_bar.dart';
import '../../widgets/tile_splash.dart';

class LikesView extends StatelessWidget {
  const LikesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredLogoAppBar(context),
      backgroundColor: context.colorTheme.onyx,
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 230,
          ),
          itemBuilder: (BuildContext context, int index) => _UserCard(
                index: index,
              ),
          itemCount: likedMocks.length,
          padding: const EdgeInsets.all(10).copyWith(top: 140)),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 210,
        height: 230,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Container(
                  color: context.colorTheme.jet,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              image: NetworkImage(
                                  likedMocks[index].imageUrl
                                ),
                              width: 130,
                              height: 130,
                            )),
                        const SizedBox(height: 10),
                        Text(
                          likedMocks[index].name,
                          style: context.textTheme.smallText,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          likedMocks[index].subtitle,
                          style: context.textTheme.smallText
                              .copyWith(color: context.colorTheme.lightGrey),
                        ),
                      ],
                    ),
                  ),
                ),
                TileSplash(onTap: () {}),
              ]),
        ),
      ),
    );
  }
}
