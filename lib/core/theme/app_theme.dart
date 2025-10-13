import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_strings.dart';
import 'app_colors.dart';
import 'styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    dialogTheme: const DialogThemeData(
      backgroundColor: AppColors.whiteE4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
    datePickerTheme: const DatePickerThemeData(
      dayStyle: Styles.medium16,
      weekdayStyle: Styles.medium16,
      backgroundColor: AppColors.whiteE4,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteE4,
      selectedItemColor: AppColors.primerColor,
      unselectedItemColor: AppColors.gray71,
      showUnselectedLabels: true,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.originalWhite,
    primaryColor: AppColors.primerColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: AppColors.primerColorB32,
      color: AppColors.originalWhite,
    ),
    useMaterial3: true,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.grayF5,

      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primerColor,
      brightness: Brightness.light,
      primary: AppColors.primerColor,
      onPrimary: Colors.white,
      secondary: AppColors.primerColor,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primerColor,
      selectionColor: AppColors.primerColorB32,
      selectionHandleColor: AppColors.primerColor,
    ),
    fontFamily: context.locale.languageCode == 'ar'
        ? AppStrings.arabicFontFamily
        : AppStrings.englishFontFamily,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xffffffff),
      contentPadding: const EdgeInsets.all(14.0),
      isDense: true,
      hintStyle: const TextStyle(color: Color(0xff9E9E9E)),
      labelStyle: const TextStyle(color: Color(0xff9E9E9E)),
      focusColor: AppColors.primerColor,
      floatingLabelStyle: const TextStyle(
        color: AppColors.primerColor,
        fontSize: 18,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: Color(0xffDBDBDB)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xffDBDBDB), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: AppColors.primerColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.originalRed, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primerColor),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        overlayColor: WidgetStateProperty.all<Color>(Colors.black26),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primerColor,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.originalWhite,
      dragHandleColor: AppColors.black27,
    ),

    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.grayE4),
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primerColor,
      selectionColor: AppColors.primerColor,
      selectionHandleColor: AppColors.primerColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardTheme: CardThemeData(
      color: const Color(0xFF1E1E1E),
      shadowColor: Colors.black.withValues(alpha: 0.5),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    fontFamily: context.locale.languageCode == 'ar'
        ? AppStrings.arabicFontFamily
        : AppStrings.englishFontFamily,
    scaffoldBackgroundColor: AppColors.originalWhite,
    primaryColor: AppColors.primerColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primerColor,
      brightness: Brightness.dark,
      primary: AppColors.primerColor,
      onPrimary: Colors.white,
      secondary: AppColors.primerColor,
      onSecondary: Colors.white,
      surface: const Color(0xFF1E1E1E),
      onSurface: Colors.white,
      error: const Color(0xFFCF6679),
      onError: Colors.black,
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all<Color>(Colors.grey),
      thumbColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primerColor),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      focusColor: AppColors.primerColor,
      floatingLabelStyle: const TextStyle(
        color: AppColors.primerColor,
        fontSize: 25,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primerColor),
        borderRadius: BorderRadius.circular(15.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primerColor),
        borderRadius: BorderRadius.circular(15.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      fillColor: const Color(0xFF333333),
      filled: true,
      hintStyle: const TextStyle(color: Color(0xff9E9E9E)),
      labelStyle: const TextStyle(color: Color(0xff9E9E9E)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primerColor),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        overlayColor: WidgetStateProperty.all<Color>(Colors.black26),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primerColor,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFF333333),
    ),
  );
}
