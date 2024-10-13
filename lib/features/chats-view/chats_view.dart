import 'package:cvelocity/features/chats-view/chat_mocks.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../widgets/blurred_logo_app_bar.dart';
import '../../widgets/profile_avatar.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BlurredLogoAppBar(context),
        extendBodyBehindAppBar: true,
        backgroundColor: context.colorTheme.onyx,
        body: ListView.builder(
            itemCount: mockChats.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 32, bottom: 16, top: 16),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: context.colorTheme.jet,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(children: [
                  ProfileAvatar(
                    imageUrl: mockChats[index].photoUrl,
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mockChats[index].name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        mockChats[index].lastMessage,
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
