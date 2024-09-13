import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class CalcPagesHeader extends StatelessWidget {
  CalcPagesHeader({
    super.key,
    required this.title,
  });
  final String title;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                TextControllerHelper.resetTexts();
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 36,
                color: ColorUiHelper.appMainColor,
              )),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyleHelper.pageTitleStyle,
          )
        ],
      ),
    );
  }
}
