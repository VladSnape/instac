part of 'follow_bloc.dart';

sealed class FollowState extends Equatable {
  const FollowState();

  @override
  List<Object> get props => [];
}

final class FollowInitial extends FollowState {}

class FollowUnfollowState extends FollowState {
  final bool follow;

  const FollowUnfollowState(this.follow);
}

class FollowUnfollowFailState extends FollowState {
  final String message;

  const FollowUnfollowFailState({required this.message});
}
