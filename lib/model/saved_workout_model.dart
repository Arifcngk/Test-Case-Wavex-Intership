import 'package:flutter/material.dart';

class WorkoutModel {
  final String name;
  final String time;
  final String? splitTime;
  final String? pace;
  final String? strokeRate;
  final String? restTime;
  final String? iconPathName;
  final Color? circleColor;

  WorkoutModel({
    required this.name,
    required this.time,
    this.splitTime,
    this.pace,
    this.strokeRate,
    this.restTime,
    this.iconPathName,
    this.circleColor,
  });
}
