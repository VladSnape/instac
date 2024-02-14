import 'package:dartz/dartz.dart';
import 'package:instac/core/failures.dart';
import 'package:instac/home/domain/entity/message_entity.dart';
import 'package:instac/home/domain/repo/insta_repo.dart';

class SendMessageUseCase {
  final Instarepo instarepo;

  SendMessageUseCase(this.instarepo);
  Future<Either<Failure, Unit>> call({
    required Message message,
  }) {
    return instarepo.sendMessage(message: message);
  }
}
