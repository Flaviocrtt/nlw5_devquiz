import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool isConfirmed;
  final VoidCallback onTap;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.isSelected = false,
    this.isConfirmed = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isConfirmed,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              color: _borderCardRight(),
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.fromBorderSide(BorderSide(color: _borderCardRight()))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                answer.title,
                style: _textStyleRight(),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: _colorRight(),
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                        BorderSide(color: _borderRight()))),
                child: Icon(_iconRight(), size: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _colorRight() {
    if (isSelected) {
      if (isConfirmed) {
        return answer.isRight ? AppColors.darkGreen : AppColors.darkRed;
      } else {
        return AppColors.lightGrey;
      }
    }
    return AppColors.white;
  }

  Color _borderRight() {
    if (isSelected) {
      if (isConfirmed) {
        return answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
      } else {
        return AppColors.lightGrey;
      }
    }
    return AppColors.border;
  }

  Color _borderCardRight() {
    if (isSelected) {
      if (isConfirmed) {
        return answer.isRight ? AppColors.green : AppColors.red;
      } else {
        return AppColors.lightGrey;
      }
    }
    return AppColors.border;
  }

  TextStyle _textStyleRight() {
    if (isSelected) {
      if (isConfirmed) {
        return answer.isRight
            ? AppTextStyles.bodyDarkGreen
            : AppTextStyles.bodyDarkRed;
      } else {
        return AppTextStyles.bodylightGrey;
      }
    }
    return AppTextStyles.body;
  }

  IconData _iconRight() {
    if (isConfirmed && isSelected) {
      return answer.isRight ? Icons.check : Icons.close;
    }
    return Icons.circle;
  }
}
