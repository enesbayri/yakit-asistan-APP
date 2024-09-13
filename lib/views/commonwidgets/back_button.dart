import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class GoBackPageButton extends StatelessWidget {
  const GoBackPageButton(
      {super.key, required this.icon, this.padding, this.onPressed});

  final Widget icon;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: ColorUiHelper.appSecondColor,
      onPressed: () {
        if (onPressed != null) onPressed!();
        Navigator.of(context).pop();
      },
      icon: icon,
      padding: padding,
    );
  }
}
