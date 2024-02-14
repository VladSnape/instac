import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String author;
  final String text;
  final Timestamp timestamp;
  final String reader;
  final String? messageId;
  final String? chatroomId;

  Message(
      {required this.timestamp,
      required this.reader,
      this.messageId,
      this.chatroomId,
      required this.author,
      required this.text});
}
