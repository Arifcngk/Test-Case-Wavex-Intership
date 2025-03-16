import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_button_widget.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_textfield_card_widget.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:test_case_wavex_intership/screens/training_screen/row_screen/widget/custom_card_widget.dart';

class SingleTimeViewScreen extends StatefulWidget {
  const SingleTimeViewScreen({super.key});

  @override
  State<SingleTimeViewScreen> createState() => _SingleTimeViewScreenState();
}

class _SingleTimeViewScreenState extends State<SingleTimeViewScreen> {
  String _selectedTime = ''; // Seçilen zamanı tutacak
  String _selectedSplitTime = ''; // Seçilen zamanı tutacak
  String _selectedPace = ''; // Seçilen zamanı tutacak
  String _selectedStroke = ''; // Seçilen zamanı tutacak
  bool _isTimeSelected = false;
  bool _isSplitTimeSelected = false;
  bool _isPaceSelected = false;
  bool _isStrokeSelected = false;

  // saved workout switch button controller
  final _savedController = ValueNotifier<bool>(false);
  // saved workout switch text controller
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _showTimePicker(BuildContext context) {
    DateTime now = DateTime.now();
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: true, // Saniye sütununu göster
      onConfirm: (date) {
        setState(() {
          _selectedTime = '${date.hour.toString().padLeft(2, '0')}:'
              '${date.minute.toString().padLeft(2, '0')}:'
              '${date.second.toString().padLeft(2, '0')}';
          _isTimeSelected = true;
        });
      },
      currentTime: now,
    );
  }

  //split time methodu herhangi bir işlem yapılmadı tasarımsal olarak görünmesi için yazıldı
  void _showSplitTimePicker(BuildContext context) {
    DateTime now = DateTime.now();
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false, // Saniye sütununu gizleyelim
      onConfirm: (date) {
        setState(() {
          _selectedSplitTime = '${date.hour.toString().padLeft(2, '0')}:'
              '${date.minute.toString().padLeft(2, '0')}';
          _isSplitTimeSelected = true;
        });
      },
      currentTime: now,
    );
  }

  //pace  methodu herhangi bir işlem yapılmadı tasarımsal olarak görünmesi için yazıldı
  void _showPacePicker(BuildContext context) {
    DateTime now = DateTime.now();
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: true, // Saniye sütununu göster
      onConfirm: (date) {
        setState(() {
          _selectedPace = '${date.hour.toString().padLeft(2, '0')}:'
              '${date.minute.toString().padLeft(2, '0')}:'
              '${date.second.toString().padLeft(2, '0')}';
          _isPaceSelected = true;
        });
      },
      currentTime: now,
    );
  }

  //stroke methodu herhangi bir işlem yapılmadı tasarımsal olarak görünmesi için yazıldı
  void _showStrokePicker(BuildContext context) {
    DateTime now = DateTime.now();
    DatePickerBdaya.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: true, // Saniye sütununu göster
      onConfirm: (date) {
        setState(() {
          _selectedStroke = '${date.hour.toString().padLeft(2, '0')}'
              '${date.minute.toString().padLeft(2, '0')}';
          _isStrokeSelected = true;
        });
      },
      currentTime: now,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Single Time",
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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Time Input
              CustomTextFieldCardWidget(
                inputText: "Time",
                suffixText: "/500 m",
                selectedAttribute: _selectedTime,
                isTimeSelected: _isTimeSelected,
                onTap: () => _showTimePicker(context),
              ),
              const SizedBox(height: 16),
              //Split Time Input
              CustomTextFieldCardWidget(
                inputText: "Split Time",
                suffixText: "/500 m",
                selectedAttribute: _selectedSplitTime,
                isTimeSelected: _isSplitTimeSelected,
                onTap: () => _showSplitTimePicker(context),
              ),
              const SizedBox(height: 16),
              // Set targets Text
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
              // Pace input
              CustomTextFieldCardWidget(
                inputText: "Pace",
                suffixText: "/500 m",
                selectedAttribute: _selectedPace,
                isTimeSelected: _isPaceSelected,
                onTap: () => _showPacePicker(context),
              ),
              const SizedBox(height: 16),
              // Stroke Rate input
              CustomTextFieldCardWidget(
                inputText: "Stroke Rate",
                suffixText: "spm",
                selectedAttribute: _selectedStroke,
                isTimeSelected: _isStrokeSelected,
                onTap: () => _showStrokePicker(context),
              ),
              const SizedBox(height: 16),
              // save workout switch button
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
                      width: 42, // Genişliği küçülttük
                      height: 24, // Yüksekliği küçülttük
                      thumb: Container(
                        width: 18, // Dairenin boyutunu küçülttük
                        height: 18,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _savedCustomTextField(),
            ],
          ),
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
                    onPressed: isSaved
                        ? () {
                            // Butona tıklandığında yapılacak işlemler buraya yazılır.
                          }
                        : () {}, // Pasif hale getirmek için boş bir fonksiyon verdik.
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
                      width: double.infinity, // Genişliği sınırla
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
