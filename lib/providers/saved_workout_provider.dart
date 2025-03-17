import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/model/saved_workout_model.dart';

class SavedWorkoutProvider with ChangeNotifier {
  final List<WorkoutModel> _workouts = [];

  List<WorkoutModel> get workouts => _workouts;

  void addWorkout({
    required String name,
    required String time,
    required String splitTime,
    required String pace,
    required String strokeRate,
  }) {
    final workout = WorkoutModel(
      name: name,
      time: time,
      splitTime: splitTime,
      pace: pace,
      strokeRate: strokeRate,
    );
    _workouts.add(workout);
    notifyListeners(); // Durum değiştiğinde dinleyicilere haber ver
  }
}
