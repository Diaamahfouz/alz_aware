import 'dart:io';
import 'package:alz_aware/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/config/classes/state_status.dart';
import '../../../../core/dependency_injection/injectable_config.dart';
import '../../../../core/theme/app_colors.dart' show AppColors;
import '../../../../core/theme/app_images.dart';
import '../../../../core/theme/styles.dart';
import '../../../home/presentation/widgets/home_feature_card.dart';
import '../bloc/result_from_image_cubit.dart';
import '../bloc/result_from_image_states.dart';
import '../functions/result_from_image_function.dart';
import '../widgets/result_from_image_shimmer.dart';

class ResultFromImageScreen extends StatefulWidget {
  const ResultFromImageScreen({super.key, this.imagePath});
  final File? imagePath;

  @override
  State<ResultFromImageScreen> createState() => _ResultFromImageScreenState();
}

class _ResultFromImageScreenState extends State<ResultFromImageScreen> {
  late ResultFromImageCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<ResultFromImageCubit>();
    if (widget.imagePath != null) {
      cubit.getPrediction(widget.imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            AppImages.coreCommonAssetsImagesSplashScreenLogoIos,
            height: 300,
            width: 200,
          ),
        ),
        body: BlocBuilder<ResultFromImageCubit, ResultFromImageStates>(
          builder: (context, state) {
            if (state.getPredictionState?.state == StateStatusEnum.loading) {
              return ResultFromImageShimmer();
            } else if (state.getPredictionState?.state ==
                StateStatusEnum.error) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      state.getPredictionState?.exception ??
                          'An error occurred',
                      style: Styles.regular16.copyWith(color: AppColors.redD9),
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    title: 'Retry',
                    onTap: () {
                      if (widget.imagePath != null) {
                        cubit.getPrediction(widget.imagePath);
                      }
                    },
                  ),
                ],
              );
            } else {
              final noImpairmentPrediction =
                  state.getPredictionState?.data ?? noImpairment;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text('Your Scan Result', style: Styles.bold18),
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteF4,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            getTitleForPrediction(noImpairmentPrediction),
                            style: Styles.medium16.copyWith(
                              fontSize: 20,
                              color: getTileColor(noImpairmentPrediction),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            getDescriptionForPrediction(noImpairmentPrediction),
                            style: Styles.regular14.copyWith(
                              color: AppColors.grey74,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      "Tips to Maintain a Healthy Mind ",
                      style: Styles.medium16,
                    ),
                    HomeFeatureCard(
                      backgroundColor: AppColors.redFF,
                      title: getTitleSeverePrediction(
                        noImpairmentPrediction,
                        0,
                      ),
                      subtitle: getSubTitleSeverePrediction(
                        noImpairmentPrediction,
                        0,
                      ),
                      svgAsset: getIconSeverePrediction(
                        noImpairmentPrediction,
                        0,
                      ),
                      subtitleColor: AppColors.grey74,
                    ),
                    HomeFeatureCard(
                      backgroundColor: AppColors.greenF2,
                      title: getTitleSeverePrediction(
                        noImpairmentPrediction,
                        1,
                      ),
                      subtitle: getSubTitleSeverePrediction(
                        noImpairmentPrediction,
                        1,
                      ),
                      svgAsset: getIconSeverePrediction(
                        noImpairmentPrediction,
                        1,
                      ),
                      subtitleColor: AppColors.grey74,
                    ),
                    HomeFeatureCard(
                      backgroundColor: AppColors.yellowFE,
                      title: getTitleSeverePrediction(
                        noImpairmentPrediction,
                        2,
                      ),
                      subtitle: getSubTitleSeverePrediction(
                        noImpairmentPrediction,
                        2,
                      ),
                      svgAsset: getIconSeverePrediction(
                        noImpairmentPrediction,
                        2,
                      ),
                      subtitleColor: AppColors.grey74,
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      title: "Done",
                      isGradient: false,
                      onTap: () {
                        context.go(Routes.home);
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
