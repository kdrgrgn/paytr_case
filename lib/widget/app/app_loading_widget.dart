import 'package:flutter/material.dart';
import 'package:paytr_case/app_constant/app_colors.dart';

class AppLoadingWidget extends StatelessWidget {
  final Color color;
  const AppLoadingWidget({super.key, this.color = appDarkColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
