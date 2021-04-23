import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  final rightAnswersNotifier = ValueNotifier<int>(0);
  int get rightAnswers => rightAnswersNotifier.value;
  set rightAnswers(int value) => rightAnswersNotifier.value = value;
}
