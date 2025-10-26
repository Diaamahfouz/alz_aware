import 'package:alz_aware/core/common/widgets/custom_button.dart';
import 'package:alz_aware/features/questions/presentation/bloc/questions_state.dart';
import 'package:alz_aware/features/questions/presentation/widgets/custom_question_widget.dart';
import 'package:alz_aware/features/questions/presentation/bloc/questions_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CustomTypeQuestion extends StatelessWidget {
  const CustomTypeQuestion({
    super.key,
    this.onTapAndNext,
    required this.itemsCount,
    required this.questions,
    required this.type,
    this.onTapAndBack,
  });
  final void Function()? onTapAndNext;
  final int type;
  final int itemsCount;
  final List<String> questions;
  final void Function()? onTapAndBack;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsCubit, QuestionsState>(
      builder: (context, state) {
        final cubit = context.read<QuestionsCubit>();
        final score = cubit.getTypeScore(type);
        final isComplete = cubit.isTypeComplete(type, itemsCount);
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: itemsCount,
                itemBuilder: (context, index) {
                  return CustomQuestionWidget(
                    questionText: questions[index],
                    type: type,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Score: $score',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (onTapAndBack != null)
                  Expanded(
                    child: CustomButton(
                      title: "Back",
                      isGradient: false,
                      onTap: onTapAndBack,
                    ),
                  ),
                if (onTapAndBack != null) SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    title: "Next",
                    isGradient: false,
                    onTap: isComplete ? onTapAndNext : null,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
