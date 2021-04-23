import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final VoidCallback onTap;

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
            color: isSelected ? _selectedBorderCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
                color:
                    isSelected ? _selectedBorderCardRight : AppColors.border))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answer.title,
              style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  color: isSelected ? _selectedColorRight : AppColors.white,
                  borderRadius: BorderRadius.circular(500),
                  border: Border.fromBorderSide(BorderSide(
                      color: isSelected
                          ? _selectedBorderRight
                          : AppColors.border))),
              child: isSelected
                  ? Icon(_selectedIconRight, size: 16, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
