import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/addcarpage/card_content.dart';

class AddCarCard extends StatelessWidget {
  AddCarCard({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      height: screen.height / 10 * 5,
      decoration: BoxDecoration(
        color: ColorUiHelper.appBgColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
              color: ColorUiHelper.appSecondColor.withOpacity(1),
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: const Offset(0, -3)),
        ],
      ),
      child: AddCarCardContent(),
    );
  }
}
