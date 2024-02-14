part of 'open_chat_bloc_bloc.dart';

sealed class OpenChatBlocEvent extends Equatable {
  const OpenChatBlocEvent();

  @override
  List<Object> get props => [];
}

final class GetChatRoom extends OpenChatBlocEvent {
  final String user1;
  final String user2;

  const GetChatRoom(this.user1, this.user2);
}
