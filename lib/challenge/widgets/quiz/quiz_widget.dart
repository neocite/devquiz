import 'dart:html';

import 'package:devquiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

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
              this.title,
              style: AppTextStyles.heading30,
            ),
          ),
          AwnserWidget(title: "Kit de desenvolvimento de interface de usuário"),
          AwnserWidget(
              isRight: true,
              isSelected: true,
              title:
                  "Possibilita a criação de aplicativos compilados nativamente"),
          AwnserWidget(title: "Acho que é uma marca de café do Himalaia"),
          AwnserWidget(
              title:
                  "Possibilita a criação de desktops que são muito incríveis")
        ],
      ),
    );
  }
}
