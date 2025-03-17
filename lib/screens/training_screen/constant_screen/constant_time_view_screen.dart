import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_textfield_card_widget.dart';

class BuildTimeTabScreen extends StatefulWidget {
  const BuildTimeTabScreen({super.key});

  @override
  State<BuildTimeTabScreen> createState() => _BuildTimeTabScreenState();
}

class _BuildTimeTabScreenState extends State<BuildTimeTabScreen> {
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _restTimeController = TextEditingController();
  final TextEditingController _paceController = TextEditingController();
  final TextEditingController _strokeController = TextEditingController();
  bool _isTimeSelected = false;
  bool _isRestTimeSelected = false;
  bool _isPaceSelected = false;
  bool _isStrokeSelected = false;

  // saved workout switch button controller
  final _savedController = ValueNotifier<bool>(false);
  // saved workout switch text controller
  final TextEditingController _nameController = TextEditingController();

  // Time ve Distance seçim durumu

  @override
  void dispose() {
    _timeController.dispose();
    _restTimeController.dispose();
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

  void _showRestTimePicker(BuildContext context) {
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false,
      onConfirm: (date) {
        setState(() {
          _restTimeController.text =
              '00:${date.minute.toString().padLeft(2, '0')}';
          _isRestTimeSelected = true;
        });
      },
      currentTime: DateTime(0, 0, 0, 0, 0), // Saat her zaman 00:00 olacak
    );
  }

  void _showPacePicker(BuildContext context) {
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
      currentTime: DateTime(0, 0, 0, 0, 0),
    );
  }

  void _showStrokePicker(BuildContext context) {
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
      currentTime: DateTime(0, 0, 0, 0, 0),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              controller: _restTimeController,
              isTimeSelected: _isRestTimeSelected,
              onTap: () => _showRestTimePicker(context),
              inputText: "Rest Time",
              suffixText: "/500 m",
            ),
            const SizedBox(height: 4),
            Text(
              "If you do not fill it in, the rest period will be considered undefined.",
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: const Color(0xFF6E798A),
              ),
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
