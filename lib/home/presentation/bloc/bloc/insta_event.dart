// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'insta_bloc.dart';

sealed class InstaEvent extends Equatable {
  const InstaEvent();

  @override
  List<Object> get props => [];
}

class EditProfileEvent extends InstaEvent {
  final String userId;
  final String? newUserName;

  final String? profilePic;
  final String? bio;

  const EditProfileEvent({
    required this.userId,
    this.newUserName,
    this.profilePic,
    this.bio,
  });
}

class GetUserInfoEvent extends InstaEvent {
  final String personId;

  const GetUserInfoEvent(this.personId);
}

class GetYourInfoEvent extends InstaEvent {
  final String personId;

  const GetYourInfoEvent(this.personId);
}
