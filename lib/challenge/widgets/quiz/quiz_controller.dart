import 'package:flutter/material.dart';

class QuizController {
  final indexSelectedNotifier = ValueNotifier<int>(-1);
  int get indexSelected => indexSelectedNotifier.value;
  set indexSelected(int value) => indexSelectedNotifier.value = value;
}
