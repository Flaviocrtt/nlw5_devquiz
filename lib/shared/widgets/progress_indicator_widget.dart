import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressIndicadorWidget extends StatelessWidget {
  final double value;

  const ProgressIndicadorWidget({Key? key, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: 0.3,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
