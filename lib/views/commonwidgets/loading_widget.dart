import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';

// ignore: must_be_immutable
class LoadingWidget extends StatelessWidget {
  LoadingWidget({super.key, this.isNotOpacity});
  final screen = locator<ScreenSizeHelper>();
  bool? isNotOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      height: screen.height,
      decoration: BoxDecoration(
          color: isNotOpacity == true
              ? ColorUiHelper.appBgColor
              : Colors.black.withOpacity(0.2)),
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: ColorUiHelper.appBgColor, width: 2),
              image: const DecorationImage(
                  image: AssetImage("assets/icons/loading-gif.gif"))),
          child: CircularProgressIndicator(
              color: ColorUiHelper.appMainColor.withOpacity(0.7)),
        ),
      ),
    );
  }
}
