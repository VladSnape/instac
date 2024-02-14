import 'package:dartz/dartz.dart';
import 'package:instac/auth/domain/entity/user_entity.dart';
import 'package:instac/core/failures.dart';
import 'package:instac/home/domain/entity/chat_room_entity.dart';
import 'package:instac/home/domain/entity/message_entity.dart';

abstract class Instarepo {
  // search
  Future<Either<Failure, Unit>> follow(
      {required String personId, required String yourId});
  Future<Either<Failure, Unit>> unfollow(
      {required String personId, required String yourId});

  // profile
  Future<Either<Failure, UserEntity>> getUserInfo({required String personId});

  Future<Either<Failure, Unit>> editProfile(
      {String? newUserName, required userId, String? profilePic, String? bio});
// post
  Future<Either<Failure, Unit>> postPic();

// chat Functions
  Future<Either<Failure, Unit>> sendMessage({
    required Message message,
  });
  String openChatRoom({required String person1, required String person2});
  Future<Either<Failure, List<ChatRoomEntity>>> getChatRooms(
      {required String userId});
  // notifications
}
