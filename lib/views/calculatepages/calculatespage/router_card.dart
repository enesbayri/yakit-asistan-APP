import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class CalcutesPageCard extends StatelessWidget {
  CalcutesPageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width - 20,
      height: 120,
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
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: Text(
                    title,
                    style: TextStyleHelper.calcutesCardTitleStyle,
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  Flexible(
                      child: Text(
                    subtitle,
                    style: TextStyleHelper.calcutesCardSubtitleStyle,
                  )),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Center(
                  child: Icon(
                icon,
                color: ColorUiHelper.calcutesTextColor,
                size: 50,
              )))
        ],
      ),
    );
  }
}
