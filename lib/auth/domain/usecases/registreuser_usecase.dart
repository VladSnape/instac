import 'package:dartz/dartz.dart';
import 'package:instac/auth/domain/repo/auth_repo.dart';
import 'package:instac/core/failures.dart';

class RegistreUserUseCase {
  final AuthRepo authRepo;

  RegistreUserUseCase(this.authRepo);
  Future<Either<Failure, Unit>> call(
      {required String email, required String password, String? name}) async {
    return await authRepo.registreUser(
        email: email, password: password, name: name);
  }
}
