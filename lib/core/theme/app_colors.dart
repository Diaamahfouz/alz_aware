import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primerColor = Color(0xff3E7A80);
  static const Color secondaryColor = Color(0xffFF5D83);
  static Color primerColorB32 = Color(0xff3E7A80).withValues(alpha: 0.32);
  static const Color originalBlack = Color(0xff000000);
  static const Color black12 = Color(0xff121212);
  static const Color originalWhite = Color(0xffFFFFFF);
  static const Color greyF6 = Color(0xffF6F6F6);
  static const Color greyEE = Color(0xffEEEEEE);
  static const Color greyCF = Color(0xffCFCFCF);
  static const Color greyAE = Color(0xffAEAEAE);
  static const Color grey9A = Color(0xff9A9A9A);
  static const Color grey74 = Color(0xff747474);
  static const Color grey47 = Color(0xff474747);
  static const Color greyEF = Color(0xffEFEFEF);
  static const Color originalRed = Color(0xffFF0000);
  static const Color redF0 = Color(0xffF04438);
  static const Color redD9 = Color(0xffD92D20);
  static const Color green32 = Color(0xff32D583);
  static const Color green0A = Color(0xff0A9E59);
  static const Color greenF2 = Color(0xffF2F9F9);
  static const Color orangeF5 = Color(0xffF5A524);
  static const Color yellowFE = Color(0xffFEFBE9);
  static const Color redF3 = Color(0xffF31260);
  static const Color redFFF1 = Color(0xffFFF1F0);
  static const Color redFF = Color(0xffFFF4F5);
  static const Color blue18 = Color(0xff1890FF);
  static const Color transparent = Color(0x00000000);

  static BoxShadow shadowBox = BoxShadow(
    color: AppColors.grey47,
    blurRadius: 10,
    spreadRadius: 0,
    offset: Offset(0, 4),
  );

  static const LinearGradient primerGradient = LinearGradient(
    colors: [primerColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
