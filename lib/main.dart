import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/global/theme/app_theme.dart';
import 'package:test_case_wavex_intership/screens/bottom_navigator_global.dart';
import 'package:test_case_wavex_intership/screens/training_screen/row_screen/row_view_sceen.dart';
import 'package:test_case_wavex_intership/screens/training_screen/single_time_screen/single_time_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WaveX Internship',
      theme: buildAppTheme(),
      home: const SingleTimeViewScreen(),
    );
  }
}
