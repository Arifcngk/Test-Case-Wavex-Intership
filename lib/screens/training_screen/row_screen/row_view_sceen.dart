import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_case_wavex_intership/screens/training_screen/row_screen/widget/custom_card_widget.dart';
import 'package:flutter/services.dart';

class RowViewScreen extends StatefulWidget {
  final String? time;
  final String? restTime;

  const RowViewScreen({super.key, this.time, this.restTime});

  @override
  State<RowViewScreen> createState() => _RowViewScreenState();
}

class _RowViewScreenState extends State<RowViewScreen> {
  late int _second;
  late int _workSeconds;
  late int _restSeconds;
  bool _isTimerPaused = false;
  late Timer _timer;
  bool _isCountingUp = false;
  bool _isResting = false;

  @override
  void initState() {
    super.initState();
    _workSeconds = widget.time != null ? _parseTimeToSeconds(widget.time!) : 0;
    _restSeconds =
        widget.restTime != null ? _parseTimeToSeconds(widget.restTime!) : 0;
    _isCountingUp = widget.time == null && widget.restTime == null;
    _second = _isCountingUp
        ? 0
        : _workSeconds; // İleri sayım için 0, geri sayım için workSeconds
    _startTimer();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    _timer.cancel();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  // gelen zamanı parse eden method
  int _parseTimeToSeconds(String time) {
    final parts = time.split(':');
    if (parts.isEmpty) return 0;

    if (parts.length == 2) {
      // "MM:SS" formatı
      final minutes = int.tryParse(parts[0]) ?? 0;
      final seconds = int.tryParse(parts[1]) ?? 0;
      return (minutes * 60) + seconds;
    } else if (parts.length == 3) {
      // "HH:MM:SS" formatı
      final hours = int.tryParse(parts[0]) ?? 0;
      final minutes = int.tryParse(parts[1]) ?? 0;
      final seconds = int.tryParse(parts[2]) ?? 0;
      return (hours * 3600) + (minutes * 60) + seconds;
    }
    return 0; // Geçersiz format
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isTimerPaused) {
        setState(() {
          if (_isCountingUp) {
            _second++;
          } else if (_second > 0) {
            _second--;
          } else {
            _switchPhase();
          }
        });
      }
    });
  }

  void _switchPhase() {
    if (_isCountingUp) return; // İleri sayımda faz değiştirme yok
    if (_isResting) {
      // Dinlenme bitti, çalışmaya geç
      _second = _workSeconds;
      _isResting = false;
    } else if (_restSeconds > 0) {
      // Çalışma bitti, dinlenmeye geç
      _second = _restSeconds;
      _isResting = true;
    } else {
      // Dinlenme süresi yoksa çalışmaya geri dön
      _second = _workSeconds;
    }
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 213, // Expanded yerine sabit genişlik
                  child: Column(
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
                        subText: _isResting ? 'Rest Time' : 'Time',
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
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                _pausedMethod(context);
              },
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    _isTimerPaused
                        ? 'assets/icon/play.png'
                        : 'assets/icon/pause.png',
                    width: 24,
                    height: 24,
                    color: const Color(0xFF001C37),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _pausedMethod(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: SizedBox(
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
              _timer.cancel();
              Navigator.pop(context); // Diyaloğu kapat
              Navigator.pop(context); // Geri dön
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
  }

  Widget _pausedButton(BuildContext context) {
    return SizedBox(
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
          _timer.cancel();
          Navigator.pop(context); // Geri dön
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
    );
  }
}
