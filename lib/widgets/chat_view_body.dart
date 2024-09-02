import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/text_field_send_message.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ChatBubble();
            },
          ),
        ),
        const CustomSendMessageField(),
      ],
    );
  }
}
