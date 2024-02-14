import 'package:instac/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(super.bio, super.followers, super.following, super.profilePic,
      super.posts,
      {required super.id, required super.name});
}
