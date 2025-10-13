import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/constants/app_strings.dart';

class AlzAWare extends StatelessWidget {
  const AlzAWare({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return _buildMaterialApp(context);
    }

    return Platform.isIOS
        ? CupertinoTheme(
            data: CupertinoThemeData(
              primaryColor: AppColors.primerColor,
              scaffoldBackgroundColor: AppColors.originalWhite,
              barBackgroundColor: AppColors.originalWhite,
              textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(
                  fontFamily: context.locale.languageCode == 'ar'
                      ? AppStrings.arabicFontFamily
                      : AppStrings.englishFontFamily,
                ),
              ),
            ),
            child: _buildMaterialApp(context),
          )
        : _buildMaterialApp(context);
  }

  Widget _buildMaterialApp(BuildContext context) {
    return ScreenUtilInit(
      designSize: kIsWeb
          ? const Size(1440, 1024)
          : const Size(375, 812), // mobile size
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(context),
            darkTheme: AppTheme.darkTheme(context),
            themeMode: ThemeMode.light,
          ),
        );
      },
    );
  }
}
