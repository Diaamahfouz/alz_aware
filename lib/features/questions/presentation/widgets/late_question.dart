import 'package:alz_aware/core/common/widgets/custom_button.dart';
import 'package:alz_aware/features/questions/presentation/widgets/custom_question_widget.dart';
import 'package:alz_aware/features/questions/presentation/widgets/moderate_question.dart';
import 'package:flutter/material.dart';

class LateQuestion extends StatelessWidget {
  const LateQuestion({super.key, this.onTap, this.onBackTap});
  final void Function()? onTap;
  final void Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: getModerateQuestions().length,
            itemBuilder: (context, index) {
              return CustomQuestionWidget(
                questionText: getModerateQuestions()[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                title: "Back",
                isGradient: false,
                onTap: onBackTap,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                title: "Next",
                isGradient: false,
                onTap: onTap,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

List<String> getLateQuestions() {
  return [
    "Do you feel unable to speak at all?",
    "Do you feel unable to perform tasks?",
    "Do you have difficulty getting to know people at all?",
    "Do you have a loss of balance or feel like you fall a lot?",
    "Have you been feeling very tired lately?",
  ];
}
