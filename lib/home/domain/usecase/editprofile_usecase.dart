import 'package:dartz/dartz.dart';
import 'package:instac/core/failures.dart';
import 'package:instac/home/domain/repo/insta_repo.dart';

class EditProfileUseCase {
  final Instarepo instarepo;

  EditProfileUseCase(this.instarepo);
  Future<Either<Failure, Unit>> call(
      {String? newUserName,
      required userId,
      String? profilePic,
      String? bio}) async {
    return await instarepo.editProfile(
        userId: userId,
        newUserName: newUserName,
        bio: bio,
        profilePic: profilePic);
  }
}
