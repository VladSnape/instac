import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  final String userName;
  final String? userBio;
  final void Function()? onTap;
  const UserListTile({
    super.key,
    required this.userName,
    this.userBio,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(0, 86, 86, 86),
          ),
          height: 70,
          child: Row(
            children: [
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
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: 30,
                    child: Text(
                      userName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          overflow: TextOverflow.fade,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: 25,
                    child: Text(
                      maxLines: 1,
                      '$userBio',
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 34, 34, 34)),
                    ),
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
