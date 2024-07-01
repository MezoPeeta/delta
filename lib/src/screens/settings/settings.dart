import 'package:flutter/material.dart';

class Settings {
  final String label;
  final Widget icon;
  final Widget? trailing;

  final Function()? onTap;
  final bool isCritical;
  Settings(
      {required this.label,
      required this.icon,
      this.onTap,
      this.trailing,
      this.isCritical = false});
}
