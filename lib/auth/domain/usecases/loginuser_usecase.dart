import 'package:dartz/dartz.dart';
import 'package:instac/auth/domain/repo/auth_repo.dart';
import 'package:instac/core/failures.dart';

class LoginUserUseCase {
  final AuthRepo authRepo;

  LoginUserUseCase(this.authRepo);

  Future<Either<Failure, Unit>> call(
      {required String email, required String password}) async {
    return await authRepo.loginUser(email: email, password: password);
  }
}
