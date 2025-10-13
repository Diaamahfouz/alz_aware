import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primerColor = Color(0xff6352A4);
  static Color primerColorB32 = Color(0xff6352A4).withValues(alpha: 0.32);
  static Color primerColor6E = Color(0xff6E64AD);
  static Color primerColor25 = Color(0xff251F3E);
  static Color lavenderE8 = Color(0xffE8ECF7);
  static const Color originalBlack = Color(0xff000000);
  static const Color black27 = Color(0xff27272A);
  static const Color black2B = Color(0xff2B2B2A);
  static const Color black45 = Color(0xff45454B);
  static const Color originalWhite = Color(0xFFE4E4E7);
  static const Color whiteE4 = Color(0xffffffff);
  static const Color whiteF0 = Color(0xffF0F0F0);
  static const Color gray3F = Color(0xff3F3F46);
  static const Color gray71 = Color(0xff71717A);
  static const Color gray6C = Color(0xff6C6C6C);
  static const Color grayF5 = Color(0xffF5F5F5);
  static const Color grayC3 = Color(0xffC3C3C3);
  static const Color grayF4 = Color(0xffF4F4F5);
  static const Color grayE4 = Color(0xffE4E4E7);
  static const Color gray52 = Color(0xff52525B);
  static const Color gray92 = Color(0xff929292);
  static const Color gray59 = Color(0xff595959);
  static const Color grayF3 = Color(0xffF3F3F3);
  static const Color grayE5 = Color(0xffE5E5E5);
  static const Color grayFD = Color(0xffFDFDFD);
  static const Color grayB6 = Color(0xffB6B6BB);
  static const Color grayCF = Color(0xffCFCFCF);
  static const Color gray8F = Color(0xff8F8F8F);
  static Color purpleB10 = Color(0xff9747FF).withValues(alpha: 0.1);
  static Color purpleB08 = Color(0xff9747FF).withValues(alpha: 0.08);
  static const Color purple7E = Color(0xff7E57C2);
  static const Color purple97 = Color(0xff9747FF);
  static const Color purpleF3 = Color(0xffF4F4F5);
  static const Color originalRed = Color(0xffFF0000);
  static const Color redFF4 = Color(0xffFF4D4F);
  static const Color redF5 = Color(0xffF5222D);
  static const Color redFE = Color(0xffFEE7EF);
  static const Color green17 = Color(0xff17C964);
  static const Color orangeF5 = Color(0xffF5A524);
  static const Color redF3 = Color(0xffF31260);
  static const Color redFFF1 = Color(0xffFFF1F0);
  static const Color blue18 = Color(0xff1890FF);
  static const Color transparent = Color(0x00000000);
  static const LinearGradient primerGradient = LinearGradient(
    colors: [primerColor, purple97],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 1],
  );

  static BoxShadow shadowBox = BoxShadow(
    color: black27,
    blurRadius: 10,
    spreadRadius: 0,
    offset: Offset(0, 4),
  );
}
