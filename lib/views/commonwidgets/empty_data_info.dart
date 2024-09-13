import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class EmptyDataInfo extends StatelessWidget {
  EmptyDataInfo({
    super.key,
    required this.title,
  });

  final String title;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      height: screen.height,
      color: ColorUiHelper.appMainColor.withOpacity(0.1),
      child: Center(
        child: Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(
                color: ColorUiHelper.appMainColor,
                border: Border.all(color: ColorUiHelper.appBgColor, width: 2),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                      color: ColorUiHelper.appSecondColor,
                      blurRadius: 3,
                      spreadRadius: 3),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 36,
                  color: ColorUiHelper.appBgColor,
                ),
                Text(
                  title,
                  style: TextStyleHelper.emptyDataStyle,
                ),
              ],
            )),
      ),
    );
  }
}
