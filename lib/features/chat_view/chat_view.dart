import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../theme/app_theme.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/chat_text_field.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      if (isKeyboardVisible) {
        Future.delayed(const Duration(milliseconds: 300), _scrollToBottom);
      }
      return Scaffold(
        appBar: ChatAppBar(
          context,
          onPressed: () {},
          title: 'John Doe',
        ),
        backgroundColor: context.colorTheme.onyx,
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Message(
                    index: index,
                    isUser: index % 2 == 0,
                  );
                },
                itemCount: 20,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 20, right: 20, top: 10),
              child: ChatTextField(
                textController: TextEditingController(),
                hintText: 'Type your message here ...',
                textStyle: context.textTheme.smallText,
                onTap: () {},
              ),
            ),
          ],
        ),
      );
    });
  }
}

class Message extends StatelessWidget {
  const Message({super.key, required this.index, required this.isUser});

  final bool isUser;
  final int index;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!isUser) Text('Someone', style: context.textTheme.smallText),
        Wrap(children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: width * 0.65,
            ),
            decoration: BoxDecoration(
              color: isUser
                  ? context.colorTheme.indigoDark
                  : context.colorTheme.jet,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'Messagefiuabfdabdjkandkjandkjwandkjankwaj $index',
              style: context.textTheme.smallText,
            ),
          ),
        ]),
      ],
    );
  }
}
