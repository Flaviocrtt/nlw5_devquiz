import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/resul_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/question_indicator/question_indicator_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  bool isConfirmed = false;
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(78),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                          currentePage: value,
                          length: widget.questions.length,
                        )),
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(question: e, isConfirmed: isConfirmed))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (temMaisQuestao(value))
                        Expanded(
                            child: NextButtonWidget.white(
                                label: "Pular", onTap: nextPage)),
                      if (!isConfirmed) SizedBox(width: 7),
                      if (!isConfirmed)
                        Expanded(
                          child: NextButtonWidget.green(
                              label: "Confirmar",
                              onTap: () {
                                isConfirmed = true;
                                setState(() {});
                              }),
                        ),
                      if (estaConfirmadoTemMaisQuestao(value))
                        SizedBox(width: 7),
                      if (estaConfirmadoTemMaisQuestao(value))
                        Expanded(
                          child: NextButtonWidget.green(
                              label: "Proxima",
                              onTap: () {
                                isConfirmed = false;
                                setState(() {});
                                nextPage();
                              }),
                        ),
                      if (estaConfirmadoUltimaQuestao(value))
                        Expanded(
                          child: NextButtonWidget.green(
                              label: "Ver Resultado",
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultPage(
                                            title: widget.title,
                                            length: widget.questions.length,
                                            hitLength: 0)));
                              }),
                        ),
                    ],
                  )),
        ),
      ),
    );
  }

  bool temMaisQuestao(int value) => value < widget.questions.length - 1;

  bool estaConfirmadoTemMaisQuestao(int value) =>
      isConfirmed && value < widget.questions.length - 1;

  bool estaConfirmadoUltimaQuestao(int value) =>
      isConfirmed && value == widget.questions.length - 1;

  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
