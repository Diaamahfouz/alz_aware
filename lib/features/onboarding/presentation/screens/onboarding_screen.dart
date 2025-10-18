import 'package:alz_aware/core/common/widgets/custom_button.dart';
import 'package:alz_aware/core/routes/routes.dart';
import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/app_images.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.coreCommonAssetsImagesOnboarding),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              // SizedBox(height: 80),
              // Image(
              //   fit: BoxFit.cover,
              //   image: AssetImage(
              //     AppImages.coreCommonAssetsImagesSplashScreenLogoIos,
              //   ),
              // ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.0, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.originalBlack.withValues(alpha: 0.5),
                      AppColors.originalWhite.withValues(alpha: 0.0),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Keep Your ',
                        style: Styles.medium16.copyWith(
                          fontSize: 20,
                          color: AppColors.originalWhite,
                        ),
                        children: [
                          TextSpan(
                            text: 'Memories ',
                            style: Styles.medium16.copyWith(
                              fontSize: 20,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: 'Close.',
                            style: Styles.medium16.copyWith(
                              fontSize: 20,
                              color: AppColors.originalWhite,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "This isn’t just an app. It’s your first step toward knowing, understanding, and caring for your brain health.",
                      style: Styles.regular16.copyWith(
                        color: AppColors.originalWhite,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      title: 'Get Started',
                      isGradient: false,
                      onTap: () {
                        context.go(Routes.home);
                      },
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
