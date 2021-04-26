import 'package:flutter/widgets.dart';

import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentePage;
  final int length;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentePage,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentQuestion = currentePage + 1;
    double _progressPercent = (_currentQuestion / length).toDouble();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Questão $_currentQuestion",
              style: AppTextStyles.body,
            ),
            Text(
              "de $length",
              style: AppTextStyles.body,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        ProgressIndicadorWidget(value: _progressPercent)
      ]),
    );
  }
}
