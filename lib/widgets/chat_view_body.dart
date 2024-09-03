import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/text_field_send_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatelessWidget {
  ChatViewBody({super.key});
  final CollectionReference data =
      FirebaseFirestore.instance.collection(kMessageCollections);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: data.get(),
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
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        data: messages[index],
                      );
                    },
                  ),
                ),
                const CustomSendMessageField(),
              ],
            );
          } else {
            return const Text('Loading...');
          }
        });
  }
}
// Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               return const ChatBubble();
//             },
//           ),
//         ),
//         const CustomSendMessageField(),
//       ],
//     );