import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:test_case_wavex_intership/screens/training_screen/widget/list_widget.dart';

class SavedViewScreen extends StatelessWidget {
  const SavedViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Saved",
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            ListTileWidget(
              title: "Ekipçe",
              iconName: "sound.png",
              iconSize: 18,
              bgCircleColor: Color.fromRGBO(255, 135, 36, 0.12),
            ),
            SizedBox(height: 16),
            ListTileWidget(
              title: "sunday",
              iconName: "sound.png",
              iconSize: 18,
              bgCircleColor: Color.fromRGBO(255, 135, 36, 0.12),
            ),
            SizedBox(height: 16),
            ListTileWidget(
              title: "Best",
              iconName: "textalign.png",
              iconSize: 18,
              bgCircleColor: Color.fromRGBO(26, 72, 116, 0.12),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
