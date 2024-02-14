import 'package:dartz/dartz.dart';
import 'package:instac/core/failures.dart';
import 'package:instac/home/domain/repo/insta_repo.dart';

class FollowUseCase {
  final Instarepo instarepo;

  FollowUseCase(this.instarepo);
  Future<Either<Failure, Unit>> call(
      {required String personId, required String yourId}) async {
    return await instarepo.follow(personId: personId, yourId: yourId);
  }
}
