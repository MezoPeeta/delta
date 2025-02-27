import 'package:flutter/material.dart';

import '../styles/colors.dart';

class HyperLinkWidget extends StatelessWidget {
  const HyperLinkWidget(
      {super.key, required this.text, this.onTap, this.fontSize});
  final String text;
  final Function()? onTap;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.linkColor,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.linkColor,
            fontSize: fontSize),
      ),
    );
  }
}
