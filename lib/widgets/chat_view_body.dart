import 'package:chat_app/constants.dart';
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
            debugPrint(snapshot.data!.docs[0]['message']);
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