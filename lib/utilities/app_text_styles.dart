import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_bank_app_ui/utilities/app_colors.dart';

class AppTextStyles {
  static TextStyle get regularBlack30w700 => GoogleFonts.roboto(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 30,
      );

  static TextStyle get regularBlack16w400 => GoogleFonts.roboto(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16,
      );

  static TextStyle get regularWhite12w400 => GoogleFonts.roboto(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12);

  static TextStyle get regularBlack12w400 => GoogleFonts.roboto(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12);

  static TextStyle get regularBlack10w400 => GoogleFonts.roboto(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 9.84,
  );

  static TextStyle get interBlack13w400 => GoogleFonts.inter(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 13.06,
  );

}
