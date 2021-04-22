import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/question_model.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;

  const QuizWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 24,
            ),
            child: Text(
              question.title,
              style: AppTextStyles.heading30,
            ),
          ),
          ...question.awnsers
              .map((e) => AwnserWidget(
                    title: e.title,
                    isRight: e.isRight,
                  ))
              .toList()
        ],
      ),
    );
  }
}
