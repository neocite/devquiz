import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_controller.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onTap;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onTap,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  final controller = QuizController();

  @override
  void initState() {
    super.initState();

    controller.indexSelectedNotifier.addListener(() {
      setState(() {});
    });
  }

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
              widget.question.title,
              style: AppTextStyles.heading30,
            ),
          ),
          ...widget.question.awnsers
              .map((e) => AwnserWidget(
                    onTap: () {
                      controller.indexSelected =
                          widget.question.awnsers.indexOf(e);
                      widget.onTap();
                    },
                    isDisable: controller.indexSelected != -1,
                    isSelected: widget.question.awnsers.indexOf(e) ==
                        controller.indexSelected,
                    awnser: e,
                  ))
              .toList()
        ],
      ),
    );
  }
}
