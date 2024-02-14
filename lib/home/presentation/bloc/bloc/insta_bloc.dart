// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instac/auth/domain/entity/user_entity.dart';
import 'package:instac/home/domain/usecase/editprofile_usecase.dart';
import 'package:instac/home/domain/usecase/getuserinfo_usecase.dart';

part 'insta_event.dart';
part 'insta_state.dart';

class InstaBloc extends Bloc<InstaEvent, InstaState> {
  final EditProfileUseCase editProfileUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;
  InstaBloc(
      {required this.editProfileUseCase, required this.getUserInfoUseCase})
      : super(InstaInitial()) {
    on<EditProfileEvent>((event, emit) async {
      emit(InstaLoadingState());
      await editProfileUseCase.call(
          userId: event.userId,
          newUserName: event.newUserName,
          bio: event.bio,
          profilePic: event.profilePic);
      emit(InstaInitial());
    });
    //
    on<GetUserInfoEvent>((event, emit) async {
      emit(InstaLoadingState());
      final result = await getUserInfoUseCase.call(personId: event.personId);
      result.fold((l) {
        emit(InstaUserInfoFailState(l.message));
      }, (r) {
        emit(InstaUserInfoSeccessState(r));
      });
    });

    on<GetYourInfoEvent>((event, emit) async {
      emit(InstaLoadingState());
      final result = await getUserInfoUseCase.call(personId: event.personId);
      result.fold((l) {
        emit(InstaYourInfoFailState(l.message));
      }, (r) {
        emit(InstaYourInfoSeccessState(r));
      });
    });
  }
}
