part of 'chat_cubit.dart';

sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSuccess extends ChatState {
  final List<MessageModel> messages;

  ChatSuccess({required this.messages});
}
