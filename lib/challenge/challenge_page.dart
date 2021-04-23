import 'package:flutter/material.dart';

import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/quiz_model.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;
  const ChallengePage({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void _nextPage(VoidCallback callback) {
    if (isLastPage) {
      callback();
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.bounceIn,
      );
    }
  }

  void _gotoResultPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          quiz: widget.quiz,
          rightAnswers: controller.rightAnswers,
        ),
      ),
    );
  }

  bool get isLastPage => controller.currentPage == widget.quiz.questions.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  questions: widget.quiz.questions,
                  currentQuestion: value,
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: widget.quiz.questions
                    .map((e) => QuizWidget(
                          question: e,
                          onTap: (value) {
                            if (value) {
                              controller.rightAnswers++;
                            }
                          },
                        ))
                    .toList())),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => isLastPage
                    ? Expanded(
                        child: NextButtonWidget.green(
                          label: "Finalizar",
                          onTap: () {
                            _nextPage(() => _gotoResultPage(context));
                          },
                        ),
                      )
                    : Expanded(
                        child: NextButtonWidget.white(
                          label: "Próximo",
                          onTap: () {
                            _nextPage(() => _gotoResultPage(context));
                          },
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
