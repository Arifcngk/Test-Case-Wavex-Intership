import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(title: "Home"),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
