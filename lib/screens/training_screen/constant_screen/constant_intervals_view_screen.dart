import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_button_widget.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:test_case_wavex_intership/screens/training_screen/constant_screen/constant_distance_view_screen.dart';
import 'package:test_case_wavex_intership/screens/training_screen/constant_screen/constant_time_view_screen.dart';

class ConstantIntervalsViewScreen extends StatefulWidget {
  const ConstantIntervalsViewScreen({super.key});

  @override
  State<ConstantIntervalsViewScreen> createState() =>
      _ConstantIntervalsViewScreenState();
}

class _ConstantIntervalsViewScreenState
    extends State<ConstantIntervalsViewScreen> {
  // Kaydedilen verileri tutmak için
  final _savedController = ValueNotifier<bool>(false);
  final TextEditingController _nameController = TextEditingController();

  // Time ve Distance seçim durumu
  bool _isTimeTabSelected = true;

  @override
  Widget build(BuildContext context) {
    dispose() {
      _savedController.dispose();
      super.dispose();
    }

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
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: _tabbarButtonCustom(),
          ),
          // Seçili olan metoda göre gösterilecek ekran
          Expanded(
            child: _isTimeTabSelected
                ? const BuildTimeTabScreen()
                : const BuildDistanceTabScreen(),
          ),
        ],
      ),
      bottomNavigationBar: _bottomSaveStart(),
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

  Padding _bottomSaveStart() {
    return Padding(
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
                  onPressed: isSaved ? () {} : () {},
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
    );
  }
}
