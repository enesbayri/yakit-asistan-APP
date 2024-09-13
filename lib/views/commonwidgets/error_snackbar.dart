import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class ErrorSnackBar {
  static showErrorSnackBar(BuildContext context,
      {required title, bool? isInfo}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: ColorUiHelper.errorBarBgColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        content: SizedBox(
          height: 30,
          child: Row(
            children: [
              Icon(
                isInfo == true ? Icons.info : Icons.dangerous_outlined,
                size: 24,
                color: isInfo == true
                    ? ColorUiHelper.errorBarSecondTextColor
                    : ColorUiHelper.errorBarTextColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: isInfo == true
                    ? TextStyleHelper.errorBarInfoStyle
                    : TextStyleHelper.addCarAlert,
              )
            ],
          ),
        )));
  }
}
