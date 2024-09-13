import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class CarsPageTextWithIcon extends StatelessWidget {
  const CarsPageTextWithIcon({
    super.key,
    required this.icon,
    required this.title,
  });
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: 120,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(
              width: 2,
            ),
            Text(
              title,
              style: TextStyleHelper.calcutesCardSubtitleStyle,
            )
          ],
        ),
      ),
    );
  }
}
