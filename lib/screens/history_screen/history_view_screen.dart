import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';

class HistoryViewScreen extends StatelessWidget {
  const HistoryViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(title: "History"),
      body: Center(
        child: Text("History"),
      ),
    );
  }
}
