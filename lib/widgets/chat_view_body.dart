import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChatBubble(),
      ],
    );
  }
}
