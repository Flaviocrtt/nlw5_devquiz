import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int questionAnswered;
  final int totalQuestions;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.questionAnswered,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 17),
          Text(
            title,
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 17),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text("${questionAnswered}/${totalQuestions}",
                    style: AppTextStyles.body11),
              ),
              Expanded(
                  flex: 4,
                  child: ProgressIndicadorWidget(
                      value: questionAnswered / totalQuestions))
            ],
          )
        ],
      ),
    );
  }
}
