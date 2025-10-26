import 'package:alz_aware/core/common/widgets/custom_button.dart';
import 'package:alz_aware/core/routes/routes.dart';
import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/app_icons.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:alz_aware/features/home/presentation/widgets/home_feature_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NormalResult extends StatelessWidget {
  const NormalResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Keep observing yourself or your loved one, and follow these tips to support your memory.',
          style: Styles.regular14.copyWith(color: AppColors.grey74),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text('Tips to Maintain a Healthy Mind ', style: Styles.bold18),
        ),
        SizedBox(height: 16),
        HomeFeatureCard(
          backgroundColor: AppColors.redFF,
          title: "Stay Connected",
          subtitle:
              "Talk to friends or family regularly, social interaction boosts memory",
          svgAsset: AppIcons.coreCommonAssetsIconsUserGroupNormal,
          subtitleColor: AppColors.grey74,
        ),
        HomeFeatureCard(
          backgroundColor: AppColors.greenF2,
          title: "Stay Physically Active",
          subtitle: "A short walk daily improves blood flow to the brain.",
          svgAsset: AppIcons.coreCommonAssetsIconsNormalIcon2,
          subtitleColor: AppColors.grey74,
        ),
        HomeFeatureCard(
          backgroundColor: AppColors.yellowFE,
          title: "Keep Your Mind Engaged",
          subtitle:
              "Try puzzles, reading, or memory games every day to keep your brain active.",
          svgAsset: AppIcons.coreCommonAssetsIconsIconPuzzleNormal,
          subtitleColor: AppColors.grey74,
        ),
        SizedBox(height: 20),
        CustomButton(
          title: 'Done',
          isGradient: false,
          onTap: () {
            context.go(Routes.home);
          },
        ),
      ],
    );
  }
}
