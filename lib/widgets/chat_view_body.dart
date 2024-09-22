import 'package:chat_app/widgets/list_view_chat_bubble.dart';
import 'package:chat_app/widgets/text_field_send_message.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key, required this.email});
  final String email;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  

  final ScrollController scrController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListViewChatBubble(
            scrController: scrController,
            email: widget.email,
          ),
        ),
        CustomSendMessageField(
          scrControler: scrController,
          email: widget.email,
        ),
      ],
    );
  }
}
