import 'package:flutter/material.dart';
import 'package:noortify/custom_bottom_bar.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            CustomBottomBar(selectedIndex: 0, indexSelectionCallback: (s) {}),
        body: Center(
          child: Text("HSHSH"),
        ));
  }
}
