import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_case_wavex_intership/screens/training_screen/row_screen/widget/custom_card_widget.dart';
import 'package:test_case_wavex_intership/screens/training_screen/training_view_screen.dart';

class RowViewSceen extends StatefulWidget {
  const RowViewSceen({super.key});

  @override
  State<RowViewSceen> createState() => _RowViewSceenState();
}

class _RowViewSceenState extends State<RowViewSceen> {
  int _second = 0;
  bool _isTimerPaused = false;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _second++;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  String _formatTimer(int second) {
    final minutes = (second ~/ 60).toString().padLeft(2, '0');
    final secs = (second % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001C37),
      body: Stack(
        children: [
          // Mevcut içerik
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 82, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Sol tarafa yerleştirilen Container
                Column(
                  children: [
                    const Spacer(),
                    CustomCardWidget(
                      cardWith: 213,
                      cardHeight: 88,
                      cardColor: const Color(0xFFF3F4F6),
                      textColor: const Color(0xFF143A5F),
                      textSize: 40,
                      subTextSize: 16,
                      textWeight: FontWeight.w500,
                      subTextWeight: FontWeight.w400,
                      titleText: _formatTimer(_second),
                      subText: 'Time',
                      sizedBoxHeight: 0,
                    ),
                    const CustomCardWidget(
                      cardWith: 213,
                      cardHeight: 88,
                      textSize: 40,
                      textWeight: FontWeight.w500,
                      titleText: '24',
                      subText: 'SPM',
                      sizedBoxHeight: 0,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                // Sağ Taraf Container
                const Column(
                  children: [
                    Spacer(),
                    CustomCardWidget(
                      cardWith: 460,
                      cardHeight: 190,
                      textSize: 96,
                      textWeight: FontWeight.w500,
                      titleText: "1500",
                      subText: "/500 m",
                      sizedBoxHeight: 2,
                    ),
                    Row(
                      children: [
                        CustomCardWidget(
                          cardWith: 226,
                          cardHeight: 128,
                          textSize: 48,
                          titleText: "2:24.9",
                          subText: "/500 m",
                          sizedBoxHeight: 2,
                        ),
                        SizedBox(width: 8),
                        CustomCardWidget(
                          cardWith: 226,
                          cardHeight: 128,
                          textSize: 48,
                          titleText: "2:24.9",
                          subText: "/500 m",
                          sizedBoxHeight: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Sol üst köşeye pause ikonu
          Positioned(
            top: 42,
            left: 63,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                _pausedButton(context);
                setState(() {
                  _isTimerPaused = !_isTimerPaused;
                });
              },
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/icon/pause.png',
                    width: 24,
                    height: 24,
                    color: const Color(0XFF001C37),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _pausedButton(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: SizedBox(
              width: 203,
              height: 62,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8724),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TrainingViewScreen(),
                    ));
                  },
                  child: Text(
                    "Save and Exit",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
