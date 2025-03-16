import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_case_wavex_intership/providers/saved_workout_provider.dart';
import 'package:test_case_wavex_intership/screens/training_screen/row_screen/widget/custom_card_widget.dart';
import 'package:test_case_wavex_intership/screens/training_screen/training_view_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class RowViewSceen extends StatefulWidget {
  final String? time;

  const RowViewSceen({super.key, this.time});

  @override
  State<RowViewSceen> createState() => _RowViewSceenState();
}

class _RowViewSceenState extends State<RowViewSceen> {
  late int _second;
  bool _isTimerPaused = false;
  late Timer _timer;
  bool _isCountingUp = false;

  @override
  void initState() {
    super.initState();
    _second = widget.time != null ? _parseTimeToSeconds(widget.time!) : 0;
    _isCountingUp = widget.time == null;
    _startTimer();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    _timer.cancel();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]); // Eski yönlendirmeyi geri yükle
    super.dispose();
  }

  int _parseTimeToSeconds(String time) {
    final parts = time.split(':');
    if (parts.length != 3) return 0;
    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);
    final seconds = int.parse(parts[2]);
    return (hours * 3600) + (minutes * 60) + seconds;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isTimerPaused) {
        setState(() {
          if (_isCountingUp) {
            _second++;
          } else {
            if (_second > 0) {
              _second--;
            } else {
              _timer.cancel();
            }
          }
        });
      }
    });
  }

  String _formatTimer(int second) {
    final hours = (second ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((second % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (second % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001C37),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 82, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                    color: const Color(0xFF001C37),
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
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TrainingViewScreen(),
                  ));
                },
                child: Text(
                  "Save and Exit",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
