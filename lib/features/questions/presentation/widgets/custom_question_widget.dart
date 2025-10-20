import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:alz_aware/features/questions/presentation/widgets/question_choices.dart';
import 'package:flutter/material.dart';

class CustomQuestionWidget extends StatefulWidget {
  const CustomQuestionWidget({super.key, required this.questionText});
  final String questionText;

  @override
  State<CustomQuestionWidget> createState() => _CustomQuestionWidgetState();
}

class _CustomQuestionWidgetState extends State<CustomQuestionWidget> {
  bool isSelectedTrue = false;
  bool isSelectedFalse = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.questionText, style: Styles.regular16),
        SizedBox(height: 10),
        Row(
          children: [
            QuestionChoices(
              title: "False",
              isSelected: isSelectedFalse,
              icon: isSelectedFalse ? Icons.cancel : Icons.cancel_outlined,
              iconColor: isSelectedFalse ? AppColors.redD9 : null,
              textColor: isSelectedFalse ? AppColors.redD9 : null,
              onTap: () {
                setState(() {
                  isSelectedFalse = true;
                  isSelectedTrue = false;
                });
              },
            ),
            Spacer(),
            QuestionChoices(
              title: "True",
              isSelected: isSelectedTrue,
              icon: isSelectedTrue
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
              iconColor: isSelectedTrue ? AppColors.green0A : null,
              textColor: isSelectedTrue ? AppColors.green0A : null,
              onTap: () {
                setState(() {
                  isSelectedTrue = true;
                  isSelectedFalse = false;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
