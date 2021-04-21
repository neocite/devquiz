import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier(HomeState.empty);
  set state(HomeState homeState) => stateNotifier.value = homeState;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = new UserModel(
        name: "Paulo",
        photoUrl: "https://avatars.githubusercontent.com/u/2176885?v=4");
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          questionAnswered: 1,
          questions: [
            QuestionModel(title: "Está curtindo o NLW?", awnsers: [
              AwnserModel(title: "Sim"),
              AwnserModel(title: "Não"),
              AwnserModel(title: "Muito", isRight: true),
              AwnserModel(title: "D+", isRight: true),
            ]),
            QuestionModel(title: "Está curtindo o DEV FULL CYCLE?", awnsers: [
              AwnserModel(title: "Sim"),
              AwnserModel(title: "Não"),
              AwnserModel(title: "Muito", isRight: true),
              AwnserModel(title: "D+", isRight: true),
            ])
          ],
          image: AppImages.blocks,
          level: Level.facil)
    ];
    state = HomeState.success;
  }
}
