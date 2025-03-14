import 'package:flutter/material.dart';
import 'package:test_case_wavex_intership/screens/app_bar_global.dart';
import 'package:test_case_wavex_intership/screens/training_screen/saved_screen/saved_view_screen.dart';
import 'package:test_case_wavex_intership/screens/training_screen/widget/list_widget.dart';

class TrainingViewScreen extends StatelessWidget {
  const TrainingViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Training",
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SavedViewScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset(
                'assets/icon/bookmark.png',
                width: 24,
                height: 24,
                color: Theme.of(context).appBarTheme.iconTheme!.color,
              ),
            ),
          )
        ],
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            children: [
              ListTileWidget(
                title: "Just Row",
                iconName: "stroge.png",
                iconSize: 18,
                bgCircleColor: Color.fromRGBO(23, 178, 106, 0.12),
              ),
              SizedBox(height: 16),
              ListTileWidget(
                title: "Just Row",
                iconName: "clock.png",
                bgCircleColor: Color.fromRGBO(142, 0, 47, 0.12),
              ),
              SizedBox(height: 16),
              ListTileWidget(
                title: "Just Row",
                iconName: "sound.png",
                bgCircleColor: Color.fromRGBO(255, 135, 36, 0.12),
              ),
              SizedBox(height: 16),
              ListTileWidget(
                title: "Just Row",
                iconName: "textalign.png",
                bgCircleColor: Color.fromRGBO(26, 72, 116, 0.12),
              ),
            ],
          )),
    );
  }
}
