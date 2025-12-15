import 'package:alz_aware/core/theme/app_images.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:alz_aware/features/questions/presentation/functions/questions_function.dart';
import 'package:flutter/material.dart';
import '../widgets/half_pie_chart.dart';

class QuestionsResult extends StatelessWidget {
  const QuestionsResult({super.key, this.resultPercentage});
  final double? resultPercentage;

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
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text('Assessment Result', style: Styles.bold18),
              ),
              HalfPieChart(
                percentage: resultPercentage ?? 0,
                displayPercentage: resultPercentage ?? 0,
                size: 200,
              ),
              Text(
                getRiskLabel(resultPercentage ?? 0),
                style: Styles.medium16.copyWith(
                  color: getColorBasedOnRisk(resultPercentage ?? 0),
                ),
              ),
              getResultWidget(resultPercentage ?? 0),
            ],
          ),
        ),
      ),
    );
  }
}
