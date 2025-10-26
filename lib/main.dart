import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'app.dart';
import 'core/config/storage/cache_helper.dart';
import 'core/config/storage/lang.dart';
import 'core/dependency_injection/injectable_config.dart';
import 'core/helper/bloc_observer.dart';

const bool runLocal = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    EasyLocalization(
      supportedLocales: [arabicLocale, englishLocale],
      fallbackLocale: englishLocale,
      startLocale: englishLocale,
      path: assetsLocalization,
      child: const AlzAWare(),
    ),
  );
    // Initialize shared preferences
  await SP.initialSharedPreference();
  // Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();
  // Set custom Bloc observer for debugging
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  //==================FOR WEB=====================
  GoRouter.optionURLReflectsImperativeAPIs = true;
}
