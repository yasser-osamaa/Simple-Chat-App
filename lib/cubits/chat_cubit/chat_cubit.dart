import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final CollectionReference msg =
      FirebaseFirestore.instance.collection(kMessageCollections);
  List<MessageModel> messages = [];
  void sendMessage({required String message, required String email}) {
    msg.add({
      kMessageDocs: message,
      kCreatedAt: DateTime.now(),
      kId: email,
    });
  }

  void getMessages() {
    msg.orderBy(kCreatedAt, descending: true).snapshots().listen(
      (event) {
        messages.clear();
        for (var doc in event.docs) {
          messages.add(MessageModel.fromJson(doc));
        }
        emit(ChatSuccess(messages: messages));
      },
    );
  }
}
