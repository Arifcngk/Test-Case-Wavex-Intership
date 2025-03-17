import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_case_wavex_intership/global/widgets/list_widget.dart';
import 'package:test_case_wavex_intership/providers/saved_workout_provider.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';

class SavedViewScreen extends StatelessWidget {
  const SavedViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedWorkouts = context.watch<SavedWorkoutProvider>().workouts;

    return Scaffold(
      appBar: GlobalAppBar(
        title: "Saved",
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/icon/arrow_back.png',
              width: 24,
              height: 24,
              color: Theme.of(context).appBarTheme.iconTheme!.color,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
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
            ...savedWorkouts.map(
              (workout) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ListTileWidget(
                  title: workout.name,
                  iconName: workout.iconPathName ?? 'default_icon.png',
                  iconSize: 18,
                  bgCircleColor: const Color.fromRGBO(26, 72, 116, 0.12),
                  onTap: () {
                    Navigator.pop(context, workout);
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
