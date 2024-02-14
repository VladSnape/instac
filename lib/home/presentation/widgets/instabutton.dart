import 'package:flutter/material.dart';

class InstaButton extends StatelessWidget {
  const InstaButton({
    super.key,
    required this.themeColor,
    required this.text,
    this.function,
  });
  final void Function()? function;
  final String text;
  final Color themeColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeColor,
        ),
        padding: const EdgeInsets.only(top: 7, bottom: 7, left: 40, right: 40),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
