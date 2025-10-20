import 'package:alz_aware/features/home/presentation/screens/home_screen.dart';
import 'package:alz_aware/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:alz_aware/features/questions/presentation/screens/questions_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.onboarding,
  routes: [
    _customAnimatedGoRoute(
      route: Routes.home,
      page: (state, context) =>
          HomeScreen(key: ValueKey(context.locale.languageCode.toString())),
    ),
    _customAnimatedGoRoute(
      route: Routes.onboarding,
      page: (state, context) => OnboardingScreen(
        key: ValueKey(context.locale.languageCode.toString()),
      ),
    ),
    _customAnimatedGoRoute(
      route: Routes.questions,
      page: (state, context) => QuestionsScreen(
        key: ValueKey(context.locale.languageCode.toString()),
      ),
    ),
  ],
);

GoRoute _customAnimatedGoRoute({
  required String route,
  required Widget Function(GoRouterState state, BuildContext context) page,
  Duration duration = const Duration(milliseconds: 450),
  Offset beginOffset = const Offset(1, 0),
  Offset endOffset = Offset.zero,
}) => GoRoute(
  path: route,
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: page(state, context),
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: endOffset,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: child,
      );
    },
  ),
);
