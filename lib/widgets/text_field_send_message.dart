import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomSendMessageField extends StatelessWidget {
  const CustomSendMessageField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          border: outLineBorder(),
          enabledBorder: outLineBorder(),
          focusedBorder: outLineBorder(),
          hintText: 'Send Message',
          suffixIcon: const Icon(
            Icons.send,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outLineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(color: kPrimaryColor),
    );
  }
}
