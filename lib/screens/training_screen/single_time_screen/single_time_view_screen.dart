import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_textfield_card_widget.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';

class SingleTimeViewScreen extends StatefulWidget {
  const SingleTimeViewScreen({super.key});

  @override
  State<SingleTimeViewScreen> createState() => _SingleTimeViewScreenState();
}

class _SingleTimeViewScreenState extends State<SingleTimeViewScreen> {
  String _selectedTime = ''; // Seçilen zamanı tutacak
  String _selectedSplitTime = ''; // Seçilen zamanı tutacak
  bool _isTimeSelected = false;
  bool _isSplitTimeSelected = false;

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
        child: Column(
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
            CustomTextFieldCardWidget(
              inputText: "Split Time",
              suffixText: "/500 m",
              selectedAttribute: _selectedSplitTime,
              isTimeSelected: _isSplitTimeSelected,
              onTap: () => _showSplitTimePicker(context),
            ),
            //Split Time Input
          ],
        ),
      ),
    );
  }
}
