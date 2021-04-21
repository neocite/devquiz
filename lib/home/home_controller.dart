import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'home_state.dart';

class HomeController {
  final homeRepository = HomeRepository();
  final stateNotifier = ValueNotifier(HomeState.empty);
  set state(HomeState homeState) => stateNotifier.value = homeState;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    user = await homeRepository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await homeRepository.getQuizzes();
    state = HomeState.success;
  }
}
