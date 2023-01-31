import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remood/app/core/values/app_colors.dart';

class CustomTextStyle extends TextStyle {
  static TextStyle h1(Color color) {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: color,
    );
  }

  static TextStyle h2(Color color) {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle h3(Color color) {
    return GoogleFonts.poppins(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle normalText(Color color) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static TextStyle textButton(Color color) {
    return GoogleFonts.roboto(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }

  static TextStyle reportHeading() {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.mainColor.withOpacity(0.5),
    );
  }

  static TextStyle customh2(Color color, double size) {
    return h2(color).copyWith(fontSize: size);
  }
}
