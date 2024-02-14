part of 'insta_bloc.dart';

sealed class InstaState extends Equatable {
  const InstaState();

  @override
  List<Object> get props => [];
}

final class InstaInitial extends InstaState {}

class InstaSeccessState extends InstaState {}

class InstaFailState extends InstaState {}

class InstaLoadingState extends InstaState {}

class InstaUserInfoSeccessState extends InstaState {
  final UserEntity user;

  const InstaUserInfoSeccessState(this.user);
}

class InstaUserInfoFailState extends InstaState {
  final String message;

  const InstaUserInfoFailState(this.message);
}

class InstaYourInfoSeccessState extends InstaState {
  final UserEntity user;

  const InstaYourInfoSeccessState(this.user);
}

class InstaYourInfoFailState extends InstaState {
  final String message;

  const InstaYourInfoFailState(this.message);
}
