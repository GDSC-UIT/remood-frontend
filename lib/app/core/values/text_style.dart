import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle extends TextStyle {
  static TextStyle onboardingText(Color color) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }
}
