import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? bio;
  final List? followers;
  final List? following;
  final List? posts;

  final String? profilePic;

  const UserEntity(
      this.bio, this.followers, this.following, this.profilePic, this.posts,
      {required this.id, this.name, this.email});

  @override
  List<Object?> get props => [id];
}
