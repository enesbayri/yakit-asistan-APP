import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/bottom_back_button.dart';

class BottomSheetContainer extends StatelessWidget {
  BottomSheetContainer({
    super.key,
    required this.content,
    required this.title,
    required this.subtitle,
  });

  final String content;
  final String title;
  final String subtitle;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      height: screen.height / 10 * 3,
      decoration: BoxDecoration(
        color: ColorUiHelper.appBgColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
              color: ColorUiHelper.appMainColor.withOpacity(1),
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: const Offset(0, -3)),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 5,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: ColorUiHelper.appMainColor,
                borderRadius: BorderRadius.circular(24)),
          ),
          const BottomCarBackButton(),
          Text(
            title,
            style: TextStyleHelper.pageTitleStyle,
          ),
          Container(
            width: 250,
            height: 2,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: ColorUiHelper.appMainColor,
                borderRadius: BorderRadius.circular(24)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content,
                style: TextStyleHelper.calcConsumpSheetStyle,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                subtitle,
                style: TextStyleHelper.pageTitleStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
