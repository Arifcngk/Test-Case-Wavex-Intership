import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_button_widget.dart';
import 'package:test_case_wavex_intership/providers/varible_workout_provider.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:test_case_wavex_intership/screens/training_screen/saved_screen/saved_view_screen.dart';
import 'package:test_case_wavex_intership/screens/training_screen/varible_screen/in_varible_screen/varible_added_view_screen.dart';
import 'package:provider/provider.dart';
import 'package:test_case_wavex_intership/screens/training_screen/varible_screen/in_varible_screen/varible_time_view_screen.dart';

class VaribleIntervalsViewScreen extends StatefulWidget {
  const VaribleIntervalsViewScreen({super.key});

  @override
  State<VaribleIntervalsViewScreen> createState() =>
      _VaribleIntervalsViewScreenState();
}

class _VaribleIntervalsViewScreenState
    extends State<VaribleIntervalsViewScreen> {
  final TextEditingController _nameController = TextEditingController();
  final _savedController = ValueNotifier<bool>(false);
  final List<Map<String, String>> _intervals = []; // Geçici interval listesi

  @override
  void dispose() {
    _nameController.dispose();
    _savedController.dispose();
    super.dispose();
  }

  void _addInterval(Map<String, String> interval) {
    setState(() {
      _intervals.add(interval);
    });
  }

  void _onSavePressed() {
    if (_intervals.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please add at least one interval")),
      );
      return;
    }

    if (_savedController.value && _nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a name for the workout")),
      );
      return;
    }

    final provider =
        Provider.of<WorkoutIntervalProvider>(context, listen: false);
    provider.addInterval(
      _savedController.value ? _nameController.text : "Unnamed Intervals",
      _intervals.map((interval) => interval['time']!).toList(),
      _intervals.map((interval) => interval['restTime']!).toList(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SavedViewScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Variable Intervals",
        leading: InkWell(
          onTap: () => Navigator.pop(context),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ReorderableListView.builder(
                itemCount: _intervals.length,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) newIndex -= 1;
                    final item = _intervals.removeAt(oldIndex);
                    _intervals.insert(newIndex, item);
                  });
                },
                itemBuilder: (context, index) {
                  return _listTimerVariable(index, _intervals[index]);
                },
                footer: Column(
                  children: [
                    const SizedBox(height: 16),
                    _addedButton(context),
                    const SizedBox(height: 86),
                    _intervals.isEmpty
                        ? const SizedBox.shrink()
                        : Column(
                            children: [
                              _savedCheckSwitchButton(),
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
                    onPressed: isSaved ? _onSavePressed : null,
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
                onPressed: () {}, // Start işlevselliği eklenebilir
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _savedCheckSwitchButton() {
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

  Widget _listTimerVariable(int index, Map<String, String> interval) {
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
                interval['time'] ?? "00:00",
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
                interval['restTime'] ?? "00:00",
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
      onPressed: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const VaribleIntervalsAddedViewScreen()),
        );
        if (result != null && result is Map<String, String>) {
          _addInterval(result);
        }
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
                        decoration:
                            const InputDecoration(border: InputBorder.none),
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
