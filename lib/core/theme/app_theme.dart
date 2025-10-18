import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_strings.dart';
import 'app_colors.dart';
import 'styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    dialogTheme: const DialogThemeData(
      backgroundColor: AppColors.originalWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
    datePickerTheme: const DatePickerThemeData(
      dayStyle: Styles.medium16,
      weekdayStyle: Styles.medium16,
      backgroundColor: AppColors.originalWhite,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.originalWhite,
      selectedItemColor: AppColors.primerColor,
      unselectedItemColor: AppColors.grey74,
      showUnselectedLabels: true,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.originalWhite,
    primaryColor: AppColors.primerColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: AppColors.primerColorB32,
      backgroundColor: AppColors.originalWhite,
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
      color: AppColors.greyF6,

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
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.originalWhite,
      dragHandleColor: AppColors.grey47,
    ),

    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.greyEE),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primerColor),
      checkColor: WidgetStateProperty.all(AppColors.originalWhite),
      side: BorderSide(color: AppColors.greyCF),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all(AppColors.greyCF),
      thumbColor: WidgetStateProperty.all(AppColors.primerColor),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.primerColor,
      inactiveTrackColor: AppColors.greyCF,
      thumbColor: AppColors.primerColor,
      overlayColor: AppColors.primerColor.withOpacity(0.2),
      valueIndicatorColor: AppColors.primerColor,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.primerColor,
      unselectedLabelColor: AppColors.grey74,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.primerColor, width: 2),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.originalWhite,
      textStyle: TextStyle(color: AppColors.primerColor),
      elevation: 8,
    ),
    dividerTheme: DividerThemeData(color: AppColors.greyCF, thickness: 1),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primerColor,
      linearTrackColor: AppColors.greyCF,
      circularTrackColor: AppColors.greyCF,
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
        color: AppColors.originalWhite,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.originalWhite,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: AppColors.originalWhite,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.grey47,
      shadowColor: AppColors.black12.withOpacity(0.5),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    fontFamily: context.locale.languageCode == 'ar'
        ? AppStrings.arabicFontFamily
        : AppStrings.englishFontFamily,
    scaffoldBackgroundColor: AppColors.black12,
    primaryColor: AppColors.primerColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primerColor,
      brightness: Brightness.dark,
      primary: AppColors.primerColor,
      onPrimary: AppColors.originalWhite,
      secondary: AppColors.primerColor,
      onSecondary: AppColors.originalWhite,
      surface: AppColors.grey47,
      onSurface: AppColors.originalWhite,
      error: AppColors.redF0,
      onError: AppColors.originalWhite,
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all(AppColors.grey74),
      thumbColor: WidgetStateProperty.all(AppColors.primerColor),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primerColor),
      checkColor: WidgetStateProperty.all(AppColors.originalWhite),
      side: BorderSide(color: AppColors.greyCF),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primerColor),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.primerColor,
      inactiveTrackColor: AppColors.grey74,
      thumbColor: AppColors.primerColor,
      overlayColor: AppColors.primerColor.withOpacity(0.2),
      valueIndicatorColor: AppColors.primerColor,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.primerColor,
      unselectedLabelColor: AppColors.grey74,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.primerColor, width: 2),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.grey47,
      textStyle: TextStyle(color: AppColors.originalWhite),
      elevation: 8,
    ),
    dividerTheme: DividerThemeData(color: AppColors.grey74, thickness: 1),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primerColor,
      linearTrackColor: AppColors.grey74,
      circularTrackColor: AppColors.grey74,
    ),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primerColor),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      focusColor: AppColors.primerColor,
      floatingLabelStyle: const TextStyle(
        color: AppColors.primerColor,
        fontSize: 18,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.grey47),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.primerColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.redF0, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      fillColor: AppColors.grey47,
      filled: true,
      hintStyle: TextStyle(color: AppColors.grey9A),
      labelStyle: TextStyle(color: AppColors.grey9A),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primerColor),
        foregroundColor: WidgetStateProperty.all<Color>(
          AppColors.originalWhite,
        ),
        overlayColor: WidgetStateProperty.all<Color>(
          AppColors.grey47.withOpacity(0.2),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primerColor,
      foregroundColor: AppColors.originalWhite,
      shape: CircleBorder(),
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColors.grey47),
  );
}
