import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_button_widget.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:test_case_wavex_intership/screens/training_screen/saved_screen/saved_view_screen.dart';
import 'package:test_case_wavex_intership/screens/training_screen/varible_screen/in_varible_screen/varible_added_view_screen.dart';
import 'package:provider/provider.dart';
import 'package:test_case_wavex_intership/providers/saved_workout_provider.dart';

class VaribleIntervalsViewScreen extends StatefulWidget {
  const VaribleIntervalsViewScreen({super.key});

  @override
  State<VaribleIntervalsViewScreen> createState() =>
      _VaribleIntervalsViewScreenState();
}

class _VaribleIntervalsViewScreenState
    extends State<VaribleIntervalsViewScreen> {
  TextEditingController _nameController = TextEditingController();
  final _savedController = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final savedWorkouts = context.watch<SavedWorkoutProvider>().workouts;

    // listeye kaydetme

    // Listeyi kaydetme metodu
    void _onSavePressed() {
      if (_nameController.text.isEmpty || savedWorkouts.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text("Please enter a name and add at least one interval")),
        );
        return;
      }

      final provider =
          Provider.of<SavedWorkoutProvider>(context, listen: false);

      // Tüm interval'ları birleştirerek tek bir workout olarak kaydet
      String combinedTime =
          savedWorkouts.map((workout) => workout.time).join(", ");
      String combinedRestTime =
          savedWorkouts.map((workout) => workout.restTime).join(", ");
      if (combinedTime.length > 1 && combinedRestTime.length > 1) {
        provider.addWorkout(
          name: _nameController.text,
          iconPathName: "textalign.png",
          time: combinedTime.isEmpty ? "00:00:00" : combinedTime,
          restTime: combinedRestTime.isEmpty ? "00:00:00" : combinedRestTime,
        );
      }

      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SavedViewScreen()),
        );
      });
    }

    return Scaffold(
      appBar: GlobalAppBar(
        title: "Varible Intervals",
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ReorderableListView.builder(
                itemCount: savedWorkouts.length,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex -= 1;
                    final item = savedWorkouts.removeAt(oldIndex);
                    savedWorkouts.insert(newIndex, item);
                  });
                },
                itemBuilder: (context, index) {
                  return _listTimerVarible(index, savedWorkouts[index]);
                },
                footer: Column(
                  children: [
                    const SizedBox(height: 16),
                    _addedButton(context),
                    const SizedBox(height: 86),
                    savedWorkouts.isEmpty
                        ? const SizedBox.shrink()
                        : Column(
                            children: [
                              _savedChechSwitchButton(),
                              const SizedBox(height: 16),
                              _savedCustomTextField(),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _savedController,
                builder: (context, isSaved, child) {
                  return CustomButtonWidget(
                    cardColor: Colors.white,
                    height: 56,
                    textSize: 16,
                    borderSide: isSaved
                        ? const Color(0xFF001C37)
                        : const Color(0xFF8592A6),
                    textColor: isSaved
                        ? const Color(0xFF001C37)
                        : const Color(0xFFCED3DB),
                    text: 'Save',
                    onPressed: isSaved ? _onSavePressed : () {},
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButtonWidget(
                cardColor: const Color(0xFFFF8724),
                height: 56,
                textSize: 16,
                textColor: Colors.white,
                text: 'Start',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _savedChechSwitchButton() {
    return SizedBox(
      width: double.infinity,
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ValueListenableBuilder(
            valueListenable: _savedController,
            builder: (context, isSavedColor, child) {
              return Text(
                "Save Workout",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color(0xFF001C37),
                ),
              );
            },
          ),
          AdvancedSwitch(
            controller: _savedController,
            activeColor: const Color(0xFFFF8724),
            inactiveColor: const Color(0xFFB6BECA),
            width: 42,
            height: 24,
            thumb: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTimerVarible(int index, dynamic workout) {
    return SizedBox(
      key: ValueKey(index),
      height: 64,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFFFEFF4),
                radius: 16,
                child: Text(
                  '${index + 1}',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFDE751F),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                workout.time,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: const Color(0xFF001C37),
                ),
              ),
              const SizedBox(width: 17),
              Image.asset(
                'assets/icon/list_icon/clock.png',
                width: 16,
                height: 16,
                color: const Color(0xFF8592A6),
              ),
              const SizedBox(width: 4),
              Text(
                workout.restTime,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: const Color(0xFF001C37),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/icon/list_icon/document.png',
                width: 16,
                height: 16,
                color: const Color(0xFF8592A6),
              ),
              const SizedBox(width: 20),
              Image.asset(
                'assets/icon/list_icon/textalign.png',
                width: 16,
                height: 16,
                color: const Color(0xFF8592A6),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CustomButtonWidget _addedButton(BuildContext context) {
    return CustomButtonWidget(
      cardColor: Colors.white,
      height: 56,
      textSize: 16,
      borderSide: const Color(0xFF001C37),
      textColor: const Color(0xFF001C37),
      text: 'Add Interval +',
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const VaribleIntervalsAddedViewScreen(),
        ));
      },
    );
  }

  ValueListenableBuilder<bool> _savedCustomTextField() {
    return ValueListenableBuilder<bool>(
      valueListenable: _savedController,
      builder: (context, isSaved, child) {
        return isSaved
            ? Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFCED3DB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: const Color(0xFFFF8724),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 26,
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: const Color(0xFF001C37),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
