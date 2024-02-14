part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}

class RegistreEvent extends AuthEvent {
  final String email;
  final String password;
  final String? name;

  const RegistreEvent({required this.email, required this.password, this.name});
}
