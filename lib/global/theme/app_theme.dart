import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildAppTheme() {
  return ThemeData(
    // Genel renk şeması
    primaryColor: const Color(0xFFFF9740),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF9740),
      secondary: Color(0xFF356697),
      surface: Colors.white, // Yüzey rengi
      onPrimary: Colors.white, // Primary renk üzerindeki metin rengi
      onSecondary: Colors.white,
      onSurface: Color(0xFF8592A6),
    ),

    // BottomNavigationBar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFFF9740),
      unselectedItemColor: const Color(0xFF8592A6),
      selectedLabelStyle: GoogleFonts.raleway(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
      unselectedLabelStyle: GoogleFonts.raleway(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),

    //ListTile
    listTileTheme: ListTileThemeData(
      tileColor: Colors.black,
      textColor: const Color(0xFF001C37),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      horizontalTitleGap: 12, // Başlık ile ikon arasındaki boşluk
      minVerticalPadding: 0,
      iconColor: const Color(0xFF001C37),
      selectedColor: const Color(0xFF001C37),
      titleTextStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        height: 1.0,
        letterSpacing: 0.0,
        color: const Color(0xFF001C37),
      ),
    ),

    // AppBar teması (isteğe bağlı)
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Color(0xFF001C37)),
      titleTextStyle: GoogleFonts.inter(
        color: const Color(0xFF001C37),
        fontSize: 20,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
    ),
  );
}
