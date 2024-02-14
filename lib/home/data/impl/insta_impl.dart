import 'package:dartz/dartz.dart';
import 'package:instac/auth/domain/entity/user_entity.dart';
import 'package:instac/core/failures.dart';
import 'package:instac/home/data/dataSource/instadata_source.dart';
import 'package:instac/home/domain/entity/chat_room_entity.dart';
import 'package:instac/home/domain/entity/message_entity.dart';
import 'package:instac/home/domain/repo/insta_repo.dart';

class InstaImpl implements Instarepo {
  final InstadataSource instadataSource;

  InstaImpl(this.instadataSource);
  @override
  Future<Either<Failure, Unit>> editProfile(
      {String? newUserName,
      required userId,
      String? profilePic,
      String? bio}) async {
    try {
      instadataSource.editProfile(
          userId: userId,
          bio: bio,
          newUserName: newUserName,
          profilePic: profilePic);
      return Right(Unit as Unit);
    } catch (e) {
      return Left(MessageFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(
      {required String personId}) async {
    try {
      final user = await instadataSource.getUserInfo(personId: personId);
      return Right(user);
    } catch (e) {
      return Left(MessageFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> postPic() {
    // TODO: implement postPic
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> follow(
      {required String personId, required String yourId}) async {
    try {
      await instadataSource.follow(personId: personId, yourId: yourId);
      return const Right(unit);
    } on Exception {
      return Left(MessageFailure(message: "exception"));
    }
  }

  @override
  Future<Either<Failure, Unit>> unfollow(
      {required String personId, required String yourId}) {
    // TODO: implement unfollow
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> sendMessage({required Message message}) async {
    try {
      await instadataSource.sendMessage(message: message);
      return const Right(unit);
    } on Exception catch (e) {
      return left(MessageFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatRoomEntity>>> getChatRooms(
      {required String userId}) {
    // TODO: implement getChatRooms
    throw UnimplementedError();
  }

  @override
  String openChatRoom({required String person1, required String person2}) {
    final String c =
        instadataSource.openChatRoom(person1: person1, person2: person2);
    return c;
  }
}
