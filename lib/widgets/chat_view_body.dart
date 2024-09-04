import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_recive.dart';
import 'package:chat_app/widgets/text_field_send_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key, required this.email});
  final String email;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final CollectionReference data =
      FirebaseFirestore.instance.collection(kMessageCollections);

  final ScrollController scrController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: data.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messages = [];
            // for (var i = 0; i < snapshot.data!.docs.length; i++) {
            //   messages.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            // }
            for (var data in snapshot.data!.docs) {
              messages.add(MessageModel.fromJson(data));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return messages[index].id == widget.email
                          ? ChatBubble(
                              data: messages[index],
                            )
                          : ChatBubbleRecive(data: messages[index]);
                    },
                  ),
                ),
                CustomSendMessageField(
                  scrControler: scrController,
                  email: widget.email,
                ),
              ],
            );
          } else {
            return const Text('Loading...');
          }
        });
  }
}
