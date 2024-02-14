import 'package:flutter/material.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({
    super.key,
    required this.messageController,
    this.onpressed,
  });
  final void Function()? onpressed;
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width * 0.8,
          padding: const EdgeInsets.only(top: 20, left: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 97, 97, 97)),
              borderRadius: BorderRadius.circular(20)),
          child: TextField(
            controller: messageController,
            decoration: const InputDecoration(
              hintStyle: TextStyle(fontSize: 20),
              border: InputBorder.none,
              hintText: 'send message',
            ),
          ),
        ),
        IconButton(
            onPressed: onpressed,
            icon: const Icon(
              Icons.send,
              size: 35,
              color: Colors.blue,
            ))
      ],
    );
  }
}
