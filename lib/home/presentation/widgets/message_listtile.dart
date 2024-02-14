import 'package:flutter/material.dart';

class MessageListTile extends StatelessWidget {
  final String userName;
  final bool isYou;
  final void Function()? onTap;
  const MessageListTile({
    super.key,
    required this.userName,
    this.onTap,
    required this.isYou,
  });

  @override
  Widget build(BuildContext context) {
    final rowMainAxisAlignment =
        isYou ? MainAxisAlignment.end : MainAxisAlignment.start;
    final backgroundColor = isYou
        ? Colors.blue // Use blue color if isYou is true
        : Color.fromARGB(255, 176, 176, 176);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(0, 86, 86, 86),
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: rowMainAxisAlignment,
            children: [
              if (!isYou)
                const CircleAvatar(
                  radius: 30,
                ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: backgroundColor,
                    ),
                    child: Text(userName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            overflow: TextOverflow.fade,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        maxLines: 5),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
