import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class LinearProfressIndicatorWidget extends StatelessWidget {
  final double value;

  const LinearProfressIndicatorWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: AppColors.chartPrimary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartSecondary),
      value: this.value,
    );
  }
}
