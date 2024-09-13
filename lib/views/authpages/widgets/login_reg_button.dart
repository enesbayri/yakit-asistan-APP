// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class LoginRegisterButton extends StatelessWidget {
  LoginRegisterButton({super.key, required this.text, this.onPressed});
  final String text;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 30,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(ColorUiHelper.appMainColor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyleHelper.loginButtonStyle,
        ),
      ),
    );
  }
}
