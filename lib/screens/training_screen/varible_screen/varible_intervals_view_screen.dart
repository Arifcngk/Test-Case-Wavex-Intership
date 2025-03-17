import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/global/widgets/custom_button_widget.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';

class VaribleIntervalsViewScreen extends StatelessWidget {
  const VaribleIntervalsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Varible Intervals",
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButtonWidget(
                cardColor: Colors.white,
                height: 56,
                textSize: 16,
                borderSide: const Color(0xFF001C37),
                textColor: const Color(0xFF001C37),
                text: 'Save',
                onPressed: () {},
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
}
