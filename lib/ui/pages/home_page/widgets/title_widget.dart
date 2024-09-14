import 'package:app/ui/style/app_colors.dart';
import 'package:app/ui/style/app_style.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyle.textStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppColors.black,
      ),
    );
  }
}
