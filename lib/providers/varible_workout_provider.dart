import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/model/varible_workout_model.dart';

class WorkoutIntervalProvider extends ChangeNotifier {
  List<WorkoutInterval> _intervals = [];

  List<WorkoutInterval> get intervals => _intervals;

  void addInterval(String name, List<String> times, List<String> restTimes) {
    _intervals.add(WorkoutInterval(name: name, times: times, restTimes: restTimes));
    notifyListeners();
  }

  void removeInterval(int index) {
    _intervals.removeAt(index);
    notifyListeners();
  }
}
