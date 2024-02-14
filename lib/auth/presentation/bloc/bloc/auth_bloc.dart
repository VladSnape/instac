// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instac/auth/domain/usecases/loginuser_usecase.dart';
import 'package:instac/auth/domain/usecases/registreuser_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase loginUserUseCase;
  final RegistreUserUseCase registreUserUseCase;

  AuthBloc(this.loginUserUseCase, this.registreUserUseCase)
      : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await loginUserUseCase.call(
          email: event.email, password: event.password);
      result.fold((f) {
        emit(AuthFail(f.message));
      }, (r) => {emit(AuthSecces())});
    });
    on<RegistreEvent>((event, emit) async {
      emit(AuthLoadingState());
      final result = await registreUserUseCase.call(
          email: event.email, password: event.password, name: event.name);
      result.fold((f) {
        emit(AuthFail(f.message));
      }, (r) => {emit(AuthSecces())});
    });
  }
}
