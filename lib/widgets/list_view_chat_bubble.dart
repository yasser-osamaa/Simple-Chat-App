import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_recive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewChatBubble extends StatelessWidget {
  const ListViewChatBubble({
    super.key,
    required this.scrController,
    required this.email,
  });
  final ScrollController scrController;
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        var listMessages = BlocProvider.of<ChatCubit>(context).messages;
        return ListView.builder(
          reverse: true,
          controller: scrController,
          physics: const BouncingScrollPhysics(),
          itemCount: listMessages.length,
          itemBuilder: (context, index) {
            return listMessages[index].id == email
                ? ChatBubble(
                    data: listMessages[index],
                  )
                : ChatBubbleRecive(data: listMessages[index]);
          },
        );
      },
    );
  }
}
