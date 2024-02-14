// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instac/home/domain/usecase/follow_usecase.dart';

part 'follow_event.dart';
part 'follow_state.dart';

class FollowBloc extends Bloc<FollowEvent, FollowState> {
  final FollowUseCase followUseCase;
  FollowBloc(this.followUseCase) : super(FollowInitial()) {
    on<FollowUserEvent>((event, emit) async {
      final result =
          await followUseCase.call(personId: event.hisId, yourId: event.yourId);

      result.fold((l) {
        emit(const FollowUnfollowFailState(message: 'failed'));
      }, (r) {
        emit(const FollowUnfollowState(true));
      });
    });
  }
}
