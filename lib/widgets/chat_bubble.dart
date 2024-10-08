import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.data,
  });
  final MessageModel data;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // change
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
            bottomLeft: Radius.circular(32), //change
          ),
          color: kPrimaryColor, // change
        ),
        child: Text(
          data.msg,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
