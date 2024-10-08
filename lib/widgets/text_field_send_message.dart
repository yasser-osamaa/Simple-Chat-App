import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSendMessageField extends StatefulWidget {
  const CustomSendMessageField({
    super.key,
    required this.scrControler,
    required this.email,
  });
  final ScrollController scrControler;
  final String email;
  @override
  State<CustomSendMessageField> createState() => _CustomSendMessageFieldState();
}

class _CustomSendMessageFieldState extends State<CustomSendMessageField> {
  TextEditingController controller = TextEditingController();
  String? msg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          msg = value;
        },
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          border: outLineBorder(),
          enabledBorder: outLineBorder(),
          focusedBorder: outLineBorder(),
          hintText: 'Send Message',
          suffixIcon: GestureDetector(
            onTap: () {
              if (msg != null) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: msg!, email: widget.email);
              } else {
                showSnackBar(context, 'No Message entered', Colors.red);
              }
              msg = null;
              controller.clear();
              widget.scrControler.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            },
            child: const Icon(
              Icons.send,
              color: kPrimaryColor,
            ),
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
