import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final List<Widget> items;
  const CustomContainer({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 36, 36),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(children: items),
    );
  }
}
