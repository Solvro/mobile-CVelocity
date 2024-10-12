import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/blurred_logo_app_bar.dart';
import '../../widgets/profile_avatar.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  static const List<Map<String, String>> mockChats = [
    {'name': 'Zabka', 'message': 'Arka gdynia'},
    {'name': 'Biedronka', 'message': 'Arka gdynia'},
    {
      'name': 'Akademia Sztuk Pieknych',
      'message': 'Arka gdynia Arka gdynia Arka gdynia Arka gdynia'
    },
    {'name': 'Akademia Sztuk Pieknych', 'message': 'Arka gdynia'},
    {'name': 'Akademia Sztuk Pieknych', 'message': 'Arka gdynia'},
    {'name': 'Akademia Sztuk Pieknych', 'message': 'Arka gdynia'},
    {'name': 'Akademia Sztuk Pieknych', 'message': 'Arka gdynia'},
    {'name': 'Akademia Sztuk Pieknych', 'message': 'Arka gdynia'},
    {'name': 'Zabka', 'message': 'Arka gdynia'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BlurredLogoAppBar(context),
        extendBodyBehindAppBar: true,
        backgroundColor: context.colorTheme.onyx,
        body: ListView.builder(
            itemCount: mockChats.length,
            itemBuilder: (context, index) {
              final chat = mockChats[index];
              return Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 32, bottom: 16, top: 16),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: context.colorTheme.jet,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(children: [
                  const ProfileAvatar(),
                  const SizedBox(width: 24),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat['name']!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        chat['message']!,
                        style: TextStyle(color: context.colorTheme.lightGrey),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    ],
                  ))
                ]),
              );
            }));
  }
}
