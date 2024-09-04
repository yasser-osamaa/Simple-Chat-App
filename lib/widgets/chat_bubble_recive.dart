import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubbleRecive extends StatelessWidget {
  const ChatBubbleRecive({
    super.key,
    required this.data,
  });
  final MessageModel data;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft, // change
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 5,
        ),
        padding: const EdgeInsets.only(
          left: 16,
          top: 24,
          bottom: 24,
          right: 24,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kReciveMessage, // change
        ),
        child: Text(
          data.msg,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
