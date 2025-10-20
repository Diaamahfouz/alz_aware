import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:alz_aware/core/theme/styles.dart';
import 'package:flutter/material.dart';

class QuestionChoices extends StatefulWidget {
  const QuestionChoices({
    super.key,
    required this.title,
    required this.isSelected,
    required this.icon,
    this.onTap,
    this.iconColor,
    this.textColor,
  });

  final String title;
  final bool isSelected;
  final IconData icon;
  final void Function()? onTap;
  final Color? iconColor;
  final Color? textColor;
  @override
  State<QuestionChoices> createState() => _QuestionChoicesState();
}

class _QuestionChoicesState extends State<QuestionChoices> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Icon(widget.icon, color: widget.iconColor ?? AppColors.grey74, size: 32),
          SizedBox(width: 8),
          Text(
            widget.title,
            style: Styles.regular14.copyWith(
              color: widget.textColor ?? AppColors.grey74,
            ),
          ),
        ],
      ),
    );
  }
}
