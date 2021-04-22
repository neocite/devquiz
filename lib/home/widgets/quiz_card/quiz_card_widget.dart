import 'package:flutter/material.dart';

import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/widgets/linear_progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.quiz,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(
            color: AppColors.border,
          )),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset(quiz.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                quiz.title,
                style: AppTextStyles.heading15,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Text(
                        "${quiz.questionAnswered} de ${quiz.questions.length}",
                        style: AppTextStyles.body11,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: LinearProfressIndicatorWidget(
                        value: quiz.questionAnswered / quiz.questions.length))
              ],
            )
          ],
        ),
      ),
    );
  }
}
