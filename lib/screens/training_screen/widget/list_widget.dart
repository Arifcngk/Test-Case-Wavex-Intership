import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String iconName;
  final Color bgCircleColor;
  final double iconSize;
  const ListTileWidget({
    super.key,
    required this.title,
    required this.iconName,
    required this.bgCircleColor,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFE7E9ED),
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        height: screenHeight * 0.08,
        width: double.infinity,
        child: Center(
          child: ListTile(
            trailing: Image.asset(
              "assets/icon/arrow_next.png",
              width: iconSize,
              height: 18,
              color: const Color(0xFF001C37),
            ),
            leading: CircleAvatar(
              backgroundColor: bgCircleColor,
              radius:
                  22, // Not: normalde 20 olması lazım ama gözüme güzel gözüktüğü için 22 yaptım
              child: Image.asset(
                'assets/icon/list_icon/$iconName',
                width: 20,
                height: 20,
                color: const Color(0xFF001C37),
              ),
            ),
            title: Text(title),
          ),
        ));
  }
}
