part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

final class SendMessageEvent extends MessageEvent {
  final Message message;

  const SendMessageEvent(this.message);
}
