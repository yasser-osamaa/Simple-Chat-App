import 'package:chat_app/constants.dart';

class MessageModel {
  final String msg;
  final String id;
  MessageModel({required this.msg, required this.id});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(msg: jsonData[kMessageDocs], id: jsonData['id']);
  }
}
