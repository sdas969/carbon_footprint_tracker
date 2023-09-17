import 'package:flutter/material.dart';

class CustomDialogButton extends StatelessWidget {
  const CustomDialogButton(
      {super.key, required this.onTap, required this.text, this.flex = 1});
  final String text;
  final Function() onTap;
  final int flex;

  @override
  Widget build(BuildContext context) => Expanded(
      flex: flex,
      child: TextButton(
          onPressed: onTap,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text, style: const TextStyle(fontSize: 16)))));
}
