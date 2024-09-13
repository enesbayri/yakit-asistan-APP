import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class LoginToRegister extends StatelessWidget {
  LoginToRegister({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screen.width * 0.75 - 20,
          height: 2,
          color: ColorUiHelper.appMainColor,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hesabınız yok mu? ",
              style: TextStyleHelper.loginTitleButtonStyle,
            ),
            SizedBox(
              width: 80,
              height: 25,
              child: TextButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.only(left: 2, right: 2)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("RegisterPage");
                  },
                  child: Text(
                    "Üye Olun!",
                    style: TextStyleHelper.forgotPasswordStyle,
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
