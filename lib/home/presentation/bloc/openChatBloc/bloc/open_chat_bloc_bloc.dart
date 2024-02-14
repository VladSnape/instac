import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instac/home/domain/usecase/openchatroom_usecase.dart';

part 'open_chat_bloc_event.dart';
part 'open_chat_bloc_state.dart';

class OpenChatBlocBloc extends Bloc<OpenChatBlocEvent, OpenChatBlocState> {
  final OpenChatroomUseCase openChatroomUseCase;
  OpenChatBlocBloc(this.openChatroomUseCase) : super(OpenChatBlocInitial()) {
    on<GetChatRoom>((event, emit) {
      emit(ChatRoomLoading());
      final String chatRoomId =
          openChatroomUseCase.call(person1: event.user1, person2: event.user2);
      if (chatRoomId.isNotEmpty || chatRoomId != '') {
        emit(ChatRoomSuccess(chatRoomId));
        print(chatRoomId);
      } else {
        emit(ChatRoomFailed('chatRoom not found'));
      }
    });
  }
}
