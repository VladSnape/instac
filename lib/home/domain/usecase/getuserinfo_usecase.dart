import 'package:dartz/dartz.dart';
import 'package:instac/core/failures.dart';
import 'package:instac/home/domain/repo/insta_repo.dart';

import '../../../auth/domain/entity/user_entity.dart';

class GetUserInfoUseCase {
  final Instarepo instarepo;

  GetUserInfoUseCase(this.instarepo);
  Future<Either<Failure, UserEntity>> call({required String personId}) async {
    return await instarepo.getUserInfo(personId: personId);
  }
}
