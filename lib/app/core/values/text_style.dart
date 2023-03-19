import 'package:flutter/material.dart';
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
      color: AppColors.primary,
    );
  }

  static TextStyle customh2(Color color, double size) {
    return h2(color).copyWith(fontSize: size);
  }

  static TextStyle LoginHeading() {
    return GoogleFonts.poppins(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    );
  }

  static TextStyle LoginSlogan() {
    return GoogleFonts.poppins(
      color: AppColors.textlogin,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  static TextStyle TextLogin(Color color) {
    return GoogleFonts.poppins(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 16,
    );
  }

  static TextStyle HintTextLogin() {
    return GoogleFonts.poppins(
      color: AppColors.grey,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );
  }

  static TextStyle InputTextLogin() {
    return GoogleFonts.poppins(
      color: AppColors.mainColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle FotgotPassWord() {
    return GoogleFonts.poppins(
      color: AppColors.textForgtPassword,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }

  static TextStyle OrText() {
    return GoogleFonts.hindSiliguri(
      color: AppColors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }

  static TextStyle GoogleLogin() {
    return GoogleFonts.poppins(
      color: AppColors.googleLogin,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );
  }

  static TextStyle AccountQuestion() {
    return GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
  }

  static TextStyle AccountButton() {
    return GoogleFonts.poppins(
      color: AppColors.mainColor,
      fontWeight: FontWeight.w700,
      fontSize: 12,
    );
  }

  static TextStyle dayCalendar() {
    return GoogleFonts.poppins(
      color: AppColors.dayCalendarColor,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
  }

  static TextStyle todayCalendar() {
    return GoogleFonts.poppins(
      color: AppColors.daySelected,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
  }

  static TextStyle todayMotivationText(Color color) {
    return GoogleFonts.poppins(
        fontSize: 16, color: color, fontWeight: FontWeight.w700);
  }

  static TextStyle suggestionButtonText() {
    return GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  static TextStyle suggestionTitle() {
    return GoogleFonts.poppins(
        fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black);
  }

  static TextStyle suggestionBlogsText() {
    return GoogleFonts.workSans(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  static TextStyle suggestionViewAllText() {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.mainColor,
    );
  }

  static TextStyle suggestionTitleArticle() {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  static TextStyle searchFor() {
    return GoogleFonts.poppins(
      color: AppColors.greyscale,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textReport() {
    return GoogleFonts.poppins(
      color: AppColors.primary,
      fontSize: 40,
      fontWeight: FontWeight.w500,
    );
  }
}
