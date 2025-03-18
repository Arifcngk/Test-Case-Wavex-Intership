import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case_wavex_intership/global/theme/app_theme.dart';
import 'package:test_case_wavex_intership/providers/saved_workout_provider.dart';
import 'package:test_case_wavex_intership/screens/bottom_navigator_global.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SavedWorkoutProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      home: const BottomNavigatorGlobal(),
    );
  }
}
