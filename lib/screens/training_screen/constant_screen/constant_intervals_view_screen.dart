import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_button_widget.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_textfield_card_widget.dart';
import 'package:test_case_wavex_intership/model/saved_workout_model.dart';
import 'package:test_case_wavex_intership/providers/saved_workout_provider.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:test_case_wavex_intership/screens/training_screen/row_screen/row_view_sceen.dart';
import 'package:test_case_wavex_intership/screens/training_screen/saved_screen/saved_view_screen.dart';

class ConstantIntervalsViewScreen extends StatefulWidget {
  final WorkoutModel? workout;
  const ConstantIntervalsViewScreen({super.key, this.workout});

  @override
  State<ConstantIntervalsViewScreen> createState() =>
      _ConstantIntervalsViewScreenState();
}

class _ConstantIntervalsViewScreenState
    extends State<ConstantIntervalsViewScreen> {
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _splitTimeController = TextEditingController();
  final TextEditingController _paceController = TextEditingController();
  final TextEditingController _strokeController = TextEditingController();
  bool _isTimeSelected = false;
  bool _isSplitTimeSelected = false;
  bool _isPaceSelected = false;
  bool _isStrokeSelected = false;

  // saved workout switch button controller
  final _savedController = ValueNotifier<bool>(false);
  // saved workout switch text controller
  final TextEditingController _nameController = TextEditingController();

  // Time ve Distance seçim durumu
  bool _isTimeTabSelected = true; // Varsayılan olarak Time seçili

  @override
  void initState() {
    super.initState();
    if (widget.workout != null) {
      _timeController.text = widget.workout!.time;
      _splitTimeController.text = widget.workout!.splitTime;
      _paceController.text = widget.workout!.pace;
      _strokeController.text = widget.workout!.strokeRate;
      _nameController.text = widget.workout!.name;
      _savedController.value = true;
    }
  }

  @override
  void dispose() {
    _timeController.dispose();
    _splitTimeController.dispose();
    _paceController.dispose();
    _strokeController.dispose();
    _nameController.dispose();
    _savedController.dispose();
    super.dispose();
  }

  void _showTimePicker(BuildContext context) {
    DateTime now = DateTime.now();
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: true,
      onConfirm: (date) {
        setState(() {
          _timeController.text = '${date.hour.toString().padLeft(2, '0')}:'
              '${date.minute.toString().padLeft(2, '0')}:'
              '${date.second.toString().padLeft(2, '0')}';
          _isTimeSelected = true;
        });
      },
      currentTime: now,
    );
  }

  void _showSplitTimePicker(BuildContext context) {
    DateTime now = DateTime.now();
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false,
      onConfirm: (date) {
        setState(() {
          _splitTimeController.text = '${date.hour.toString().padLeft(2, '0')}:'
              '${date.minute.toString().padLeft(2, '0')}';
          _isSplitTimeSelected = true;
        });
      },
      currentTime: now,
    );
  }

  void _showPacePicker(BuildContext context) {
    DateTime now = DateTime.now();
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: true,
      onConfirm: (date) {
        setState(() {
          _paceController.text = '${date.hour.toString().padLeft(2, '0')}:'
              '${date.minute.toString().padLeft(2, '0')}:'
              '${date.second.toString().padLeft(2, '0')}';
          _isPaceSelected = true;
        });
      },
      currentTime: now,
    );
  }

  void _showStrokePicker(BuildContext context) {
    DateTime now = DateTime.now();
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: true,
      onConfirm: (date) {
        setState(() {
          _strokeController.text = '${date.hour.toString().padLeft(2, '0')}'
              '${date.minute.toString().padLeft(2, '0')}';
          _isStrokeSelected = true;
        });
      },
      currentTime: now,
    );
  }

  void _onSavePressed() {
    if (_nameController.text.isNotEmpty) {
      final provider =
          Provider.of<SavedWorkoutProvider>(context, listen: false);
      provider.addWorkout(
        name: _nameController.text,
        time: _timeController.text.isEmpty ? "00:00:00" : _timeController.text,
        splitTime: _splitTimeController.text.isEmpty
            ? "00:00"
            : _splitTimeController.text,
        pace: _paceController.text.isEmpty ? "00:00:00" : _paceController.text,
        strokeRate:
            _strokeController.text.isEmpty ? "0000" : _strokeController.text,
      );

      Future.delayed(Duration.zero, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SavedViewScreen()),
        );
      });
    }
  }

  void _onStartPressed() {
    if (_timeController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RowViewSceen(
                  time: _timeController.text,
                )),
      );
    }
  }

  // Time sekmesi için body içeriği
  Widget _buildTimeBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFieldCardWidget(
              controller: _timeController,
              isTimeSelected: _isTimeSelected,
              onTap: () => _showTimePicker(context),
              inputText: "Time",
              suffixText: "/500 m",
            ),
            const SizedBox(height: 16),
            CustomTextFieldCardWidget(
              controller: _splitTimeController,
              isTimeSelected: _isSplitTimeSelected,
              onTap: () => _showSplitTimePicker(context),
              inputText: "Split Time",
              suffixText: "/500 m",
            ),
            const SizedBox(height: 16),
            Text(
              "Set Targets",
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0xFF001C37),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextFieldCardWidget(
              controller: _paceController,
              isTimeSelected: _isPaceSelected,
              onTap: () => _showPacePicker(context),
              inputText: "Pace",
              suffixText: "/500 m",
            ),
            const SizedBox(height: 16),
            CustomTextFieldCardWidget(
              controller: _strokeController,
              isTimeSelected: _isStrokeSelected,
              onTap: () => _showStrokePicker(context),
              inputText: "Stroke Rate",
              suffixText: "spm",
            ),
            const SizedBox(height: 16),
            SizedBox(
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
                          color: isSavedColor
                              ? const Color(0xFFFF8724)
                              : const Color(0xFF001C37),
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
            ),
            const SizedBox(height: 16),
            _savedCustomTextField(),
          ],
        ),
      ),
    );
  }

  // Distance sekmesi için body içeriği
  Widget _buildDistanceBody() {
    return const Center(
      child: Text(
        "Distance Mode",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Constant Intervals",
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
      body: Column(
        children: [
          // Time ve Distance butonları
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isTimeTabSelected = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isTimeTabSelected
                        ? const Color(0xFFFF8724)
                        : Colors.grey[300],
                    foregroundColor:
                        _isTimeTabSelected ? Colors.white : Colors.black,
                    minimumSize: const Size(120, 40),
                  ),
                  child: const Text("Time"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isTimeTabSelected = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isTimeTabSelected
                        ? Colors.grey[300]
                        : const Color(0xFFFF8724),
                    foregroundColor:
                        _isTimeTabSelected ? Colors.black : Colors.white,
                    minimumSize: const Size(120, 40),
                  ),
                  child: const Text("Distance"),
                ),
              ],
            ),
          ),
          // Dinamik body içeriği
          Expanded(
            child: _isTimeTabSelected ? _buildTimeBody() : _buildDistanceBody(),
          ),
        ],
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
                onPressed: _onStartPressed,
              ),
            ),
          ],
        ),
      ),
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
                      height: 18,
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
