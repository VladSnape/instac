import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instac/home/domain/entity/message_entity.dart';
import 'package:instac/home/presentation/bloc/messagebloc/bloc/message_bloc.dart';
import 'package:instac/home/presentation/bloc/openChatBloc/bloc/open_chat_bloc_bloc.dart';
import 'package:instac/home/presentation/widgets/message_listtile.dart';
import 'package:instac/home/presentation/widgets/sendmessage_widget.dart';

class ChatRoomPage extends StatefulWidget {
  final String reader;
  const ChatRoomPage({super.key, required this.reader});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController messageController = TextEditingController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          BlocBuilder<OpenChatBlocBloc, OpenChatBlocState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    BlocProvider.of<OpenChatBlocBloc>(context).add(GetChatRoom(
                        FirebaseAuth.instance.currentUser!.uid, widget.reader));
                    print(
                        '${FirebaseAuth.instance.currentUser!.uid} ,${widget.reader}');
                  },
                  icon: const Icon(
                    Icons.refresh,
                    size: 30,
                    color: Colors.black,
                  ));
            },
          )
        ],
        centerTitle: true,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'user_name',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<OpenChatBlocBloc, OpenChatBlocState>(
              builder: (context, state) {
                print(state);
                if (state is ChatRoomSuccess) {
                  print(' under success state $state');

                  return Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('chatroom')
                            .doc(state.chatRoomId)
                            .collection('messages')
                            .orderBy('time', descending: false)
                            .snapshots(),
                        builder: (context, snapshot) {
                          final List messages = snapshot.data!.docs.map((e) {
                            return e.data() as Map<String, dynamic>;
                          }).toList();

                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final messageData = messages[index];
                              final isYou =
                                  FirebaseAuth.instance.currentUser?.uid ==
                                      messageData['author'];
                              return MessageListTile(
                                userName: '${messageData['message']}',
                                isYou: isYou,
                              );
                            },
                          );
                        }),
                  );
                } else if (state is ChatRoomFailed) {}
                return const Center(
                  child: Text('i have no idea what state you in '),
                );
              },
            ),
            BlocBuilder<MessageBloc, MessageState>(
              builder: (context, state) {
                return FocusScope(
                  child: SendMessageWidget(
                    messageController: messageController,
                    onpressed: () {
                      BlocProvider.of<MessageBloc>(context).add(
                          SendMessageEvent(Message(
                              timestamp: Timestamp.now(),
                              reader: widget.reader,
                              author: FirebaseAuth.instance.currentUser!.uid,
                              text: messageController.text)));
                      messageController.clear();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
