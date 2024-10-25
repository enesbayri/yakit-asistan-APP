import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class CalcPagesCalculateButton extends StatelessWidget {
  const CalcPagesCalculateButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(
              BorderSide(color: ColorUiHelper.appMainColor, width: 1)),
          overlayColor: WidgetStatePropertyAll(ColorUiHelper.appSecondColor),
        ),
        onPressed: onPressed,
        icon: Icon(
          Icons.calculate,
          color: ColorUiHelper.appMainColor,
        ),
        label: Text(
          "Hesapla!",
          style: TextStyleHelper.pageTitleStyle,
        ));
  }
}
