import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';

class SavedViewScreen extends StatelessWidget {
  const SavedViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(title: "Saved"),
      body: Center(
        child: Text("Saved"),
      ),
    );
  }
}
