import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final QuizModel quiz;
  final int rightAnswers;
  const ResultPage({
    Key? key,
    required this.quiz,
    required this.rightAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Image.asset(AppImages.trophy),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Parabéns!",
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Você acertou",
                    style: AppTextStyles.body,
                  ),
                  Text(
                    quiz.title,
                    style: AppTextStyles.bodyBold15,
                  ),
                  Text(
                    "$rightAnswers de ${quiz.questions.length} perguntas",
                    style: AppTextStyles.body,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purle(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                "Eu acertei ${rightAnswers / quiz.questions.length}% do desafio ${quiz.title} no app DevQuiz! ");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.transparent(
                          label: "Voltar ao início",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
