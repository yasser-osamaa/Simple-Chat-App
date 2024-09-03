import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomSendMessageField extends StatefulWidget {
  const CustomSendMessageField({
    super.key,
    required this.scrControler,
  });
  final ScrollController scrControler;
  @override
  State<CustomSendMessageField> createState() => _CustomSendMessageFieldState();
}

class _CustomSendMessageFieldState extends State<CustomSendMessageField> {
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessageCollections);
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
                message.add({
                  kMessageDocs: msg,
                  kCreatedAt: DateTime.now(),
                });
              } else {
                showSnackBar(context, 'No Message entered', Colors.red);
              }
              msg = null;
              controller.clear();
              Future.delayed(const Duration(milliseconds: 100), () {
                widget.scrControler.animateTo(
                  widget.scrControler.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              });
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
