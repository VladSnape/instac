import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instac/auth/domain/entity/user_entity.dart';
import 'package:instac/home/domain/entity/message_entity.dart';

abstract class InstadataSource {
  Future<void> editProfile(
      {String? newUserName, required userId, String? profilePic, String? bio});
  Future<UserEntity> getUserInfo({required String personId});
  Future<void> follow({required String personId, required String yourId});
  Future<void> sendMessage({
    required Message message,
  });
  String openChatRoom({required String person1, required String person2});
}

class InstadataSourceimplFire implements InstadataSource {
  final FirebaseFirestore firebaseFirestore;

  InstadataSourceimplFire(this.firebaseFirestore);
  @override
  Future<void> editProfile(
      {String? newUserName,
      required userId,
      String? profilePic,
      String? bio}) async {
    firebaseFirestore
        .collection('users')
        .doc(userId)
        .update({'bio': bio, 'picture': profilePic, 'name': newUserName});
  }

  @override
  Future<UserEntity> getUserInfo({required String personId}) async {
    final theUserDS =
        await firebaseFirestore.collection('users').doc(personId).get();
    final theUser = theUserDS.data();
    final UserEntity user = UserEntity(
      theUser!['bio'],
      theUser['followers'],
      theUser['following'],
      theUser['profilePic'],
      theUser['posts'],
      id: theUser['bio'],
      name: theUser['name'],
      email: theUser['email'],
    );
    return user;
  }

  @override
  Future<void> follow(
      {required String personId, required String yourId}) async {
    try {
      final personDoc = firebaseFirestore.collection('users').doc(personId);
      final yourDoc = firebaseFirestore.collection('users').doc(yourId);

      final personData = (await personDoc.get()).data();
      final yourData = (await yourDoc.get()).data();

      if (personData != null && yourData != null) {
        final personFollowers =
            List<String>.from(personData['followers'] ?? []);
        final yourFollowing = List<String>.from(yourData['following'] ?? []);
        if (yourFollowing.contains(personId) == false) {
          personFollowers.add(yourId);
          yourFollowing.add(personId);
        }

        await Future.wait([
          personDoc.update({'followers': personFollowers}),
          yourDoc.update({'following': yourFollowing}),
        ]);
      } else {
        // Handle the case where the user data is not found
        throw Exception('User data not found');
      }
    } catch (e) {
      print('Error following user: $e');
      // Handle the error, e.g., show an error message to the user
      print(
          'your id = ${yourId}}   , ============= other person id ${personId}');
      rethrow;
    }
  }

  String generateChatroomId(String userId1, String userId2) {
    final List<String> sortedIds = [userId1, userId2]..sort();
    return '${sortedIds[0]}_${sortedIds[1]}';
  }

  @override
  Future<void> sendMessage({required Message message}) async {
    final chatroomId = generateChatroomId(message.author, message.reader);
    try {
      await firebaseFirestore
          .collection('chatroom')
          .doc(chatroomId)
          .collection('messages')
          .add({
        'message': message.text,
        'time': Timestamp.now(),
        'author': message.author,
        'reader': message.reader,
      });
    } on Exception catch (e) {
      print('error = ====' + e.toString());
    }
// Usage
  }

  @override
  String openChatRoom({required String person1, required String person2}) {
    final String ChatRoomId = generateChatroomId(person1, person2);
    return ChatRoomId;
  }
}
