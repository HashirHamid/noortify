import 'package:flutter/material.dart';

class ForwardIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ForwardIconButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_forward),
      color: Color.fromARGB(255, 97, 97, 97),
      onPressed: onPressed,
      visualDensity: VisualDensity.compact,
    );
  }
}
