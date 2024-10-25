import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class ForgotPasswordButton extends StatelessWidget {
  ForgotPasswordButton({
    super.key,
  });
  final AuthService auth = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 160,
          height: 25,
          child: TextButton(
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                    EdgeInsets.only(left: 2, right: 2)),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("ForgotPasswordPage");
              },
              child: Text(
                "Şifreni mi unuttun?",
                style: TextStyleHelper.forgotPasswordStyle,
              )),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}
