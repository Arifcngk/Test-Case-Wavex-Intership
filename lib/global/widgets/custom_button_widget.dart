import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color cardColor;
  final double textSize;
  final Color textColor;
  final Color borderSide;

  const CustomButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.width = double.infinity,
    required this.height,
    required this.cardColor,
    required this.textSize,
    required this.textColor,
    this.borderSide = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: cardColor,
          overlayColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(
            color: borderSide,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: textSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
