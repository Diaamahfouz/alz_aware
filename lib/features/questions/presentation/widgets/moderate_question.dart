import 'package:alz_aware/core/common/widgets/custom_button.dart';
import 'package:alz_aware/features/questions/presentation/widgets/custom_question_widget.dart';
import 'package:flutter/material.dart';

class ModerateQuestion extends StatelessWidget {
  const ModerateQuestion({super.key, this.onTap, this.onBackTap});
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

List<String> getModerateQuestions() {
  return [
    "Do you forget your family names?",
    "Do you forget personal dates and places?",
    "Do you feel disoriented or hallucinating?",
    "Have you lost your ability to interact with money?",
    "Do you forget words and replace them with inappropriate words?",
  ];
}
