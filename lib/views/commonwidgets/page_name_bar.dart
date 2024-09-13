import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/back_button.dart';

class PageNameBar extends StatelessWidget {
  const PageNameBar({
    super.key,
    required this.pageName,
    required this.color,
    required this.width,
  });

  final String pageName;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: color),
          right: BorderSide(width: 2, color: color),
          top: BorderSide(width: 2, color: color),
        ),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        color: ColorUiHelper.appBgColor,
      ),
      child: Row(
        children: [
          GoBackPageButton(
            icon: Icon(
              Icons.arrow_back,
              color: color,
              size: 40,
            ),
            padding: const EdgeInsets.all(0),
          ),
          const Expanded(
              flex: 1,
              child: SizedBox(
                width: 1,
              )),
          Text(
            pageName,
            style: TextStyleHelper.syncPageNameStyle,
          ),
          const Expanded(
              flex: 2,
              child: SizedBox(
                width: 1,
              )),
        ],
      ),
    );
  }
}
