import 'package:alz_aware/core/common/widgets/custom_button.dart';
import 'package:alz_aware/features/questions/presentation/widgets/custom_question_widget.dart';
import 'package:flutter/material.dart';

class EarlyQuestions extends StatelessWidget {
  const EarlyQuestions({super.key, this.onTap});
  final void Function()? onTap; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: getEarlyQuestions().length,
            itemBuilder: (context, index) {
              return CustomQuestionWidget(
                questionText: getEarlyQuestions()[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
          ),
        ),
        CustomButton(
          title: "Next",
          isGradient: false,
          onTap: onTap,
        ),
      ],
    );
  }
}

List<String> getEarlyQuestions() {
  return [
    "Do you forget your daily appointments?",
    "Do you repeat the same questions?",
    "Do you forget current events?",
    "Do you forget where things are?",
    "Are you having difficulty expressing what you want to say?",
  ];
}
