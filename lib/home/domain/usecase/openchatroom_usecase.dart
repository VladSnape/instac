import 'package:instac/home/domain/repo/insta_repo.dart';

class OpenChatroomUseCase {
  final Instarepo instarepo;

  OpenChatroomUseCase(this.instarepo);
  String call({required String person1, required String person2}) {
    return instarepo.openChatRoom(person1: person1, person2: person2);
  }
}
