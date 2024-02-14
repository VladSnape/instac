import 'package:dartz/dartz.dart';

import '../../../core/failures.dart';

abstract class AuthRepo {
  // Future<Either<Failure, User>> getUser();
  Future<Either<Failure, Unit>> registreUser(
      {required String email, required String password, String? name});
  Future<Either<Failure, Unit>> loginUser(
      {required String email, required String password});
}
