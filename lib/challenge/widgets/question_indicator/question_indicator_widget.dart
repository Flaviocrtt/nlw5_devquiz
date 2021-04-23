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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Questão $currentePage",
              style: AppTextStyles.body,
            ),
            Text(
              "de ${length - 1}",
              style: AppTextStyles.body,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        ProgressIndicadorWidget(value: length / (currentePage + 1))
      ]),
    );
  }
}
