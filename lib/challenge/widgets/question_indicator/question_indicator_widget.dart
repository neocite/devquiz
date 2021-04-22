import 'package:flutter/material.dart';

import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/widgets/linear_progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final List<QuestionModel> questions;
  final int currentQuestion;

  const QuestionIndicatorWidget({
    Key? key,
    required this.questions,
    required this.currentQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Questão $currentQuestion",
                  style: AppTextStyles.body20,
                ),
                Text(
                  "de ${questions.length}",
                  style: AppTextStyles.body20,
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: LinearProfressIndicatorWidget(
                  value: currentQuestion / questions.length,
                ))
          ],
        ),
      ),
    );
  }
}
