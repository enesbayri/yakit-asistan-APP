import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/back_button.dart';

class CarDetailBackButton extends StatelessWidget {
  const CarDetailBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorUiHelper.appBgColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: ColorUiHelper.appMainColor.withOpacity(1),
                spreadRadius: 0.1,
                blurRadius: 5,
                offset: const Offset(0, 3)),
          ],
        ),
        child: GoBackPageButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorUiHelper.appMainColor,
            size: 36,
          ),
        ));
  }
}
