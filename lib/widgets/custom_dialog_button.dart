import 'package:flutter/material.dart';

class CustomDialogButton extends StatelessWidget {
  const CustomDialogButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.isLoading = false,
      this.flex = 1,
      this.isExpanded = true});
  final String text;
  final Function() onTap;
  final int flex;
  final bool isExpanded;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => isExpanded
      ? Expanded(
          flex: flex,
          child: TextButton(
              onPressed: onTap,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Text(text, style: const TextStyle(fontSize: 16)))))
      : TextButton(
          onPressed: onTap,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Text(text, style: const TextStyle(fontSize: 16))));
}
