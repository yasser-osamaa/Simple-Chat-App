

import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_recive.dart';
import 'package:flutter/material.dart';

class ListViewChatBubble extends StatelessWidget {
  const ListViewChatBubble({
    super.key,
    required this.scrController,
    required this.listMessages,
    required this.email,
  });

  final ScrollController scrController;
  final List<MessageModel> listMessages;
  final String email;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: scrController,
      physics: const BouncingScrollPhysics(),
      itemCount: listMessages.length,
      itemBuilder: (context, index) {
        return listMessages[index].id == email
            ? ChatBubble(
                data: listMessages[index],
              )
            : ChatBubbleRecive(data: listMessages[index]);
      },
    );
  }
}
