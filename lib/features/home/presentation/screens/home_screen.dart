import 'package:alz_aware/core/common/widgets/custom_button.dart';
import 'package:alz_aware/core/common/widgets/image_picker_with_out_copper.dart';
import 'package:alz_aware/core/routes/routes.dart';
import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/app_icons.dart';
import 'package:alz_aware/core/theme/app_images.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:alz_aware/features/home/presentation/widgets/slider_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/home_feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          AppImages.coreCommonAssetsImagesSplashScreenLogoIos,
          height: 300,
          width: 200,
        ),
        actions: [],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      SizedBox(height: 20),
                      Text("Welcome to AlzAware! ", style: Styles.medium16),
                      SizedBox(
                        height: isTablet ? 400.h + 20 : 300.h + 20,
                        child: SliderSection(isTablet: isTablet),
                      ),
                      Text("Check Your Memory", style: Styles.medium16),
                      Text(
                        "Answer several quick questions to check your memory health.",
                        style: Styles.medium16.copyWith(
                          color: AppColors.grey74,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      CustomButton(
                        title: "Start Test",
                        isGradient: false,
                        onTap: () {
                          context.push(Routes.questions);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Skip test, ",
                            style: Styles.regular14.copyWith(
                              color: AppColors.grey74,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft,
                            ),
                            onPressed: () async {
                              await ImagePickerWithOutCopper()
                                  .showPhotoPickerBottomSheet(context, (
                                    image,
                                  ) async {
                                    if (image != null && context.mounted) {
                                      context.go(
                                        Routes.resultFromImage,
                                        extra: {'image': image},
                                      );
                                    }
                                  });
                            },
                            child: Text(
                              "Upload Your Brain MRI ",
                              style: Styles.medium16.copyWith(
                                color: AppColors.primerColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Try a daily memory challenge!",
                        style: Styles.medium16,
                      ),
                      HomeFeatureCard(
                        backgroundColor: AppColors.redFF,
                        title: "Memory Match",
                        subtitle:
                            "Complete a daily memory challenge to improve your memory.",
                        svgAsset: AppIcons.coreCommonAssetsIconsHugeIconsBrain,
                        subtitleColor: AppColors.grey74,
                      ),
                      HomeFeatureCard(
                        backgroundColor: AppColors.greenF2,
                        title: "No Routine Day",
                        subtitle:
                            "Change one daily habit , like taking a new route or cooking something new.",
                        svgAsset: AppIcons.coreCommonAssetsIconsHomeIcon,
                        subtitleColor: AppColors.grey74,
                      ),
                      HomeFeatureCard(
                        backgroundColor: AppColors.yellowFE,
                        title: "Brain Workout",
                        subtitle: "Solve one puzzle or riddle today.",
                        svgAsset:
                            AppIcons.coreCommonAssetsIconsIconPuzzleNormal,
                        subtitleColor: AppColors.grey74,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
