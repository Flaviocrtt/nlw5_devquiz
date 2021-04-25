import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final bool isConfirmed;

  const QuizWidget({Key? key, required this.question, this.isConfirmed = false})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answers(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answers(i),
              isSelected: indexSelected == i,
              isConfirmed: widget.isConfirmed,
              onTap: () {
                indexSelected = i;
                setState(() {});
              },
            ),
        ],
      ),
    );
  }
}
