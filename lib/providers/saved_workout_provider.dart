import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/model/saved_workout_model.dart';

class SavedWorkoutProvider with ChangeNotifier {
  final List<WorkoutModel> _workouts = [];

  List<WorkoutModel> get workouts => _workouts;

  void addWorkout({
    required String name,
    required String time,
    String? splitTime,
    String? pace,
    String? strokeRate,
    String? restTime,
    String? iconPathName,
    Color? circleColor ,
    
  }) {
    final workout = WorkoutModel(
      name: name,
      time: time,
      splitTime: splitTime,
      pace: pace,
      strokeRate: strokeRate,
      restTime: restTime,
      iconPathName: iconPathName,
      circleColor: circleColor,
      
    );
    _workouts.add(workout);
    notifyListeners(); // Durum değiştiğinde dinleyicilere haber ver
  }
}
