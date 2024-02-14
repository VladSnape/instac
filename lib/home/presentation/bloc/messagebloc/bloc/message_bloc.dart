import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instac/home/domain/entity/message_entity.dart';
import 'package:instac/home/domain/usecase/send_message_usecase.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final SendMessageUseCase sendMessageUseCase;
  MessageBloc(this.sendMessageUseCase) : super(MessageInitial()) {
    on<SendMessageEvent>((event, emit) async {
      final result = await sendMessageUseCase.call(message: event.message);
      result.fold((l) {
        emit(MessageSentFailed(l.message));
      }, (r) {
        emit(MessageSentSuccess());
      });
    });
  }
}
