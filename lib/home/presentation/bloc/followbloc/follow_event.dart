part of 'follow_bloc.dart';

sealed class FollowEvent extends Equatable {
  const FollowEvent();

  @override
  List<Object> get props => [];
}

class FollowUserEvent extends FollowEvent {
  final String yourId;
  final String hisId;

  const FollowUserEvent({
    required this.yourId,
    required this.hisId,
  });
}
