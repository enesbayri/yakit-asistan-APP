import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';

class CalculatePagesScrollInputCard extends StatelessWidget {
  CalculatePagesScrollInputCard({super.key, required this.child});
  final Widget child;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      height: 130,
      decoration: BoxDecoration(
        color: ColorUiHelper.appMainColor,
        //borderRadius: BorderRadius.circular(32),
        border: Border(
            bottom: BorderSide(
                width: 1, color: ColorUiHelper.calcutesBoxBorderColor),
            top: BorderSide(
                width: 1, color: ColorUiHelper.calcutesBoxBorderColor)),
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
      child: child,
    );
  }
}
