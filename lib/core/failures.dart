abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class MessageFailure extends Failure {
  MessageFailure({required super.message});
}
