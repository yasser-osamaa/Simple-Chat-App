import 'package:chat_app/constants.dart';

class MessageModel {
  final String msg;

  MessageModel({required this.msg});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(msg: jsonData[kMessageDocs]);
  }
}
