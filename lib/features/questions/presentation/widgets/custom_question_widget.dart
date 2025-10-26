import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:alz_aware/features/questions/presentation/bloc/questions_cubit.dart';
import 'package:alz_aware/features/questions/presentation/widgets/question_choices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomQuestionWidget extends StatelessWidget {
  const CustomQuestionWidget({
    super.key,
    required this.questionText,
    required this.type,
    required this.index,
  });
  final String questionText;
  final int type;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionsCubit>();
    final answer = cubit.getAnswer(type: type, index: index);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(questionText, style: Styles.regular16),
        SizedBox(height: 10),
        Row(
          children: [
            QuestionChoices(
              title: "False",
              isSelected: answer == false,
              icon: answer == false ? Icons.cancel : Icons.cancel_outlined,
              iconColor: answer == false ? AppColors.redD9 : null,
              textColor: answer == false ? AppColors.redD9 : null,
              onTap: () =>
                  cubit.answerQuestion(type: type, answer: false, index: index),
            ),
            Spacer(),
            QuestionChoices(
              title: "True",
              isSelected: answer == true,
              icon: answer == true
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
              iconColor: answer == true ? AppColors.green0A : null,
              textColor: answer == true ? AppColors.green0A : null,
              onTap: () =>
                  cubit.answerQuestion(type: type, answer: true, index: index),
            ),
          ],
        ),
      ],
    );
  }
}
