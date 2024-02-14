part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSecces extends AuthState {}

final class AuthFail extends AuthState {
  final String message;

  const AuthFail(this.message);
}
