import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class LoginWithSocialCard extends StatelessWidget {
  LoginWithSocialCard(
      {super.key,
      this.onPressed,
      required this.cardBorderColor,
      required this.leading,
      required this.title});

  final VoidCallback? onPressed;
  final Color cardBorderColor;
  final Widget leading;
  final String title;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width * 0.60,
      height: 30,
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          border: Border.all(color: cardBorderColor, width: 4),
          borderRadius: BorderRadius.circular(24),
          color: ColorUiHelper.appBgColor,
          boxShadow: [
            BoxShadow(
              color: cardBorderColor,
              blurRadius: 0.3,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            )
          ]),
      //padding: const EdgeInsets.only(left: 16, bottom: 4, top: 4),
      child: TextButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.only(left: 10)),
        ),
        child: SizedBox(
          child: Row(
            children: [
              leading,
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyleHelper.loginWithSocialStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
