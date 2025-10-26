import 'package:alz_aware/core/dependency_injection/injectable_config.dart';
import 'package:alz_aware/core/routes/routes.dart';
import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/app_images.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:alz_aware/features/questions/presentation/bloc/questions_cubit.dart';
import 'package:alz_aware/features/questions/presentation/bloc/questions_state.dart';
import 'package:alz_aware/features/questions/presentation/functions/questions_function.dart';
import 'package:alz_aware/features/questions/presentation/widgets/custom_type_question.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<Widget> children = [];
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  int count = 0;
  late QuestionsCubit questionsCubit;

  @override
  void initState() {
    questionsCubit = getIt.get<QuestionsCubit>();
    children = [
      BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          return CustomTypeQuestion(
            itemsCount: getEarlyQuestions().length,
            questions: getEarlyQuestions(),
            type: 0,
            onTapAndNext:
                questionsCubit.isTypeComplete(0, getEarlyQuestions().length)
                ? () {
                    if (currentPage < children.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  }
                : null,
          );
        },
      ),
      BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          return CustomTypeQuestion(
            itemsCount: getModerateQuestions().length,
            questions: getModerateQuestions(),
            type: 1,
            onTapAndNext:
                questionsCubit.isTypeComplete(1, getModerateQuestions().length)
                ? () {
                    if (currentPage < children.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  }
                : null,
            onTapAndBack: () {
              if (currentPage > 0) {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
          );
        },
      ),
      BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          return CustomTypeQuestion(
            itemsCount: getLateQuestions().length,
            questions: getLateQuestions(),
            type: 2,
            onTapAndNext:
                questionsCubit.isTypeComplete(2, getLateQuestions().length)
                ? () {
                    context.go(
                      Routes.results,
                      extra: questionsCubit.resultPercentage,
                    );
                  }
                : null,
            onTapAndBack: () {
              if (currentPage > 0) {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
            },
          );
        },
      ),
    ];
    super.initState();
  }

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => questionsCubit,
      child: BlocBuilder<QuestionsCubit, QuestionsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Image.asset(
                AppImages.coreCommonAssetsImagesSplashScreenLogoIos,
                height: 300,
                width: 200,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Symptoms",
                    style: Styles.medium16.copyWith(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text(
                        currentPage == 0
                            ? "Early"
                            : currentPage == 1
                            ? "Moderate"
                            : "Late",
                        style: Styles.regular16.copyWith(
                          color: AppColors.grey74,
                        ),
                      ),
                      Spacer(),
                      Text(
                        currentPage == 0
                            ? "1pt"
                            : currentPage == 1
                            ? "2pt"
                            : "3pt",
                        style: Styles.regular16.copyWith(
                          color: AppColors.grey74,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 3,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 0,
                        end: (currentPage + 1) / children.length,
                      ),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      builder: (context, value, child) {
                        return LinearProgressIndicator(
                          value: value,
                          backgroundColor: AppColors.greyEF,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primerColor,
                          ),
                          minHeight: 3,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: PageView(
                      onPageChanged: (index) =>
                          setState(() => currentPage = index),
                      controller: _pageController,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      children: children,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
