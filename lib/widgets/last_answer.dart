import 'package:flutter/material.dart';

class LastAnswer extends StatelessWidget {
  const LastAnswer(
    this.text, {
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 150),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: text.isEmpty ? Colors.transparent : colorScheme.secondary,
            width: 3,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: colorScheme.secondary),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
