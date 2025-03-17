import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VaribleDistanceScreen extends StatelessWidget {
  const VaribleDistanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Distance Tab',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          color: const Color(0xFF143A5F),
        ),
      ),
    );
  }
}
