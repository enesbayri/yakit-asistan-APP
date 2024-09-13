import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class CarDetailContentCard extends StatelessWidget {
  const CarDetailContentCard({
    super.key,
    required this.icon,
    required this.title,
  });

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: ColorUiHelper.appMainColor,
        borderRadius: BorderRadius.circular(32),
        border:
            Border.all(width: 1, color: ColorUiHelper.calcutesBoxBorderColor),
        image: const DecorationImage(
            image: AssetImage("assets/icons/mainIcon.png"),
            opacity: 0.1,
            alignment: Alignment.centerRight),
        boxShadow: [
          BoxShadow(
              color: ColorUiHelper.appMainColor.withOpacity(1),
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        icon,
        Text(
          title,
          style: TextStyleHelper.carDetailCardItemStyle,
        )
      ]),
    );
  }
}
