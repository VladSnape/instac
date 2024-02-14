import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instac/auth/data/datasource/userdata.dart';
import 'package:instac/auth/domain/repo/auth_repo.dart';
import 'package:instac/core/failures.dart';

class AuthImpl implements AuthRepo {
  final UserData userData;

  AuthImpl(this.userData);
  @override
  Future<Either<Failure, Unit>> loginUser(
      {required String email, required String password}) async {
    try {
      await userData.loginUser(email: email, password: password);
      return Right(Unit as Unit);
    } on FirebaseAuthException catch (e) {
      return Left(MessageFailure(message: e.code));
    }
  }

  @override
  Future<Either<Failure, Unit>> registreUser(
      {required String email, required String password, String? name}) async {
    try {
      await userData.registreUser(email: email, password: password, name: name);
      return Right(Unit as Unit);
    } on FirebaseAuthException catch (e) {
      return Left(MessageFailure(message: e.code));
    }
  }
}
