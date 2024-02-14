import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  const LoginButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height * 0.33,
      width: MediaQuery.sizeOf(context).width,

      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 105, 145, 240),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
