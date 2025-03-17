import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_button_widget.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:test_case_wavex_intership/screens/training_screen/varible_screen/in_varible_screen/varible_distance_view_screen.dart';
import 'package:test_case_wavex_intership/screens/training_screen/varible_screen/in_varible_screen/varible_time_view_screen.dart';

class VaribleIntervalsAddedViewScreen extends StatefulWidget {
  const VaribleIntervalsAddedViewScreen({super.key});

  @override
  State<VaribleIntervalsAddedViewScreen> createState() =>
      _VaribleIntervalsAddedViewScreenState();
}

class _VaribleIntervalsAddedViewScreenState
    extends State<VaribleIntervalsAddedViewScreen> {

  // Time ve Distance seçim durumu
  bool _isTimeTabSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: " Intervals 1",
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
          const SizedBox(height: 8),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: _tabbarButtonCustom(),
          ),
          // Seçili olan metoda göre gösterilecek ekran
          Expanded(
            child: _isTimeTabSelected
                ? const VaribleTimeScreen()
                : const VaribleDistanceScreen(),
          ),
        ],
      ),
    );
  }

  Row _tabbarButtonCustom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButtonWidget(
            text: "time",
            onPressed: () {
              setState(() {
                _isTimeTabSelected = true;
              });
            },
            height: 36,
            cardColor:
                _isTimeTabSelected ? const Color(0xFFFF8724) : Colors.white,
            textSize: 16,
            textColor: _isTimeTabSelected ? Colors.white : Colors.black,
            borderSide: _isTimeTabSelected
                ? const Color(0xFFFF8724)
                : const Color(0xFFCED3DB),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButtonWidget(
            text: "distance",
            onPressed: () {
              setState(() {
                _isTimeTabSelected = false;
              });
            },
            height: 36,
            cardColor:
                _isTimeTabSelected ? Colors.white : const Color(0xFFFF8724),
            textSize: 16,
            textColor: _isTimeTabSelected ? Colors.black : Colors.white,
            borderSide: _isTimeTabSelected
                ? const Color(0xFFCED3DB)
                : const Color(0xFFFF8724),
          ),
        ),
      ],
    );
  }
}
