import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldCardWidget extends StatelessWidget {
  final TextEditingController controller; // Controller eklendi
  final bool isTimeSelected;
  final VoidCallback onTap;
  final String inputText;
  final String suffixText;
  final double cardHeight;

  const CustomTextFieldCardWidget({
    super.key,
    required this.controller, // String yerine controller
    required this.isTimeSelected,
    required this.onTap,
    required this.inputText,
    required this.suffixText,
    this.cardHeight = 64,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: cardHeight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFCED3DB),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    inputText,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      height: 16 / 12,
                      letterSpacing: 0,
                      color: const Color(0xFF001C37),
                    ),
                  ),
                  if (isTimeSelected)
                    Text(
                      controller
                          .text, // selectedAttribute yerine controller.text
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 16 / 12,
                        letterSpacing: 0,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
              if (isTimeSelected)
                Text(
                  suffixText,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    height: 16 / 12,
                    letterSpacing: 0,
                    color: const Color(0xFF001C37),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
