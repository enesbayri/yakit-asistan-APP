import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class AnimatedMenuButton extends StatelessWidget {
  const AnimatedMenuButton(
      {super.key, required this.icon, required this.title, this.onPressed});

  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: ColorUiHelper.appSecondColor,
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              color: ColorUiHelper.appBgColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyleHelper.menuButtonTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
