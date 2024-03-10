import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bgColor = Color(0xFFFFFFFF);

  static const primaryColor = Color(0xFF000000);
  static const secondaryColor = Color(0xFFEFEFEF);

  static const primaryTextColor = Color(0xFF4A4A4A);
  static const secondayTextColor = Color(0xFF4C5264);
  static const accentTextColor = Color(0xFF6A6A6A);

  static const whiteColor = Color(0xFFFFFFFF);
  static const blueColor = Color(0xFF394376);

  static const redColor = Color(0xFFCD2626);

  static const transparent = Colors.transparent;
}

class DiscountColor {
  static const failColor = Color(0xFFBE3032);
}

class NotificationColor {
  static const successColor = Color(0xFF00C514);
  static const failColor = Color(0xFFE62129);
  static const noticeColor = Color(0xFFFFF4D4);
}

class AppTextStyles {
  static TextStyle heading = GoogleFonts.workSans(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle headerText = GoogleFonts.workSans(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );
  static TextStyle subHeading = GoogleFonts.workSans(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  static TextStyle bodyText = GoogleFonts.workSans(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static TextStyle contentText = GoogleFonts.workSans(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle secondaryContentText = GoogleFonts.workSans(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.secondayTextColor,
  );

  static TextStyle customStyle = GoogleFonts.workSans();
}

class AppMargin {
  static const defaultMargin = 16.0;
}
