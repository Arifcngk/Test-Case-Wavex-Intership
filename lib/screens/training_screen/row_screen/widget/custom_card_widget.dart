
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardWidget extends StatelessWidget {
  final double cardWith;
  final double cardHeight;
  final Color cardColor;
  final Color textColor;
  final double textSize;
  final double subTextSize;
  final FontWeight textWeight;
  final FontWeight subTextWeight;
  final String titleText;
  final String subText;
  final double sizedBoxHeight;

  const CustomCardWidget({
    super.key,
    required this.cardWith,
    required this.cardHeight,
    this.cardColor = const Color(0xFF143A5F),
    this.textColor = Colors.white,
    required this.textSize,
    this.subTextSize = 16,
    this.textWeight = FontWeight.w500,
    this.subTextWeight = FontWeight.w500,
    required this.titleText,
    required this.subText,
    required this.sizedBoxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWith,
      height: cardHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleText,
                style: GoogleFonts.inter(
                  color: textColor,
                  fontSize: textSize,
                  fontWeight: textWeight,
                ),
              ),
              SizedBox(height: sizedBoxHeight),
              Text(
                subText,
                style: GoogleFonts.poppins(
                  color: textColor,
                  fontSize: subTextSize,
                  fontWeight: subTextWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
