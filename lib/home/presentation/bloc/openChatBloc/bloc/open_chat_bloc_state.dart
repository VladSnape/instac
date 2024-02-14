part of 'open_chat_bloc_bloc.dart';

sealed class OpenChatBlocState extends Equatable {
  const OpenChatBlocState();

  @override
  List<Object> get props => [];
}

final class OpenChatBlocInitial extends OpenChatBlocState {}

final class ChatRoomLoading extends OpenChatBlocInitial {}

final class ChatRoomSuccess extends OpenChatBlocInitial {
  final String chatRoomId;

  ChatRoomSuccess(this.chatRoomId);
}

final class ChatRoomFailed extends OpenChatBlocInitial {
  final String message;

  ChatRoomFailed(this.message);
}
