import 'package:instac/auth/domain/entity/user_entity.dart';
import 'package:instac/home/domain/entity/message_entity.dart';

class ChatRoomEntity {
  final UserEntity person1;
  final UserEntity person2;
  final List<Message>? messages;
  final String chatRoomId;

  ChatRoomEntity(
      {required this.chatRoomId,
      required this.person1,
      required this.person2,
      this.messages});
}
