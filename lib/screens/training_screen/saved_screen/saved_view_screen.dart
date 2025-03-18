import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case_wavex_intership/global/widgets/custum_listTile_widget.dart';
import 'package:test_case_wavex_intership/providers/saved_workout_provider.dart';
import 'package:test_case_wavex_intership/providers/varible_workout_provider.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:test_case_wavex_intership/screens/bottom_navigator_global.dart';
import 'package:test_case_wavex_intership/screens/training_screen/training_view_screen.dart';

class SavedViewScreen extends StatelessWidget {
  const SavedViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedWorkouts = context.watch<SavedWorkoutProvider>().workouts;
    final workoutIntervals = context.watch<WorkoutIntervalProvider>().intervals;

    return Scaffold(
      appBar: GlobalAppBar(
        title: "Saved",
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BottomNavigatorGlobal()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/icon/arrow_back.png',
              width: 24,
              height: 24,
              color: Theme.of(context).appBarTheme.iconTheme?.color,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            // Sabit liste elemanları
            const ListTileWidget(
              title: "Ekipçe",
              iconName: "sound.png",
              iconSize: 18,
              bgCircleColor: Color.fromRGBO(255, 135, 36, 0.12),
            ),
            const SizedBox(height: 16),
            const ListTileWidget(
              title: "sunday",
              iconName: "sound.png",
              iconSize: 18,
              bgCircleColor: Color.fromRGBO(255, 135, 36, 0.12),
            ),
            const SizedBox(height: 16),
            const ListTileWidget(
              title: "Best",
              iconName: "textalign.png",
              iconSize: 18,
              bgCircleColor: Color.fromRGBO(26, 72, 116, 0.12),
            ),
            const SizedBox(height: 16),
            // SavedWorkoutProvider'dan gelen veriler
            ...savedWorkouts.map(
              (workout) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ListTileWidget(
                  title: workout.name,
                  iconName: workout.iconPathName ?? 'default_icon.png',
                  iconSize: 18,
                  bgCircleColor: workout.circleColor ?? Colors.white30,
                  onTap: () {
                    Navigator.pop(context, workout);
                  },
                ),
              ),
            ),
            // WorkoutIntervalProvider'dan gelen veriler
            ...workoutIntervals.map(
              (interval) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ListTileWidget(
                  title: interval.name,
                  iconName:
                      'sound.png', // Variable Intervals için sabit ikon kullandım çünkü model sadece varible screene özel
                  iconSize: 18,
                  bgCircleColor:
                      const Color.fromRGBO(255, 135, 36, 0.12), // Örnek renk

                  onTap: () {
                    Navigator.pop(context, interval);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
