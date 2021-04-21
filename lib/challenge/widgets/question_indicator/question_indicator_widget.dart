import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
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
                  "Questão 04",
                  style: AppTextStyles.body20,
                ),
                Text(
                  "de 10",
                  style: AppTextStyles.body20,
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: LinearProfressIndicatorWidget(
                  value: .7,
                ))
          ],
        ),
      ),
    );
  }
}
