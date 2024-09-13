import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class LoginRegisterAppTitle extends StatelessWidget {
  const LoginRegisterAppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AnimationControll.loginController,
      builder: (context, child) => Opacity(
        opacity: AnimationControll.loginSequenceAnimation["titleOpacity"].value,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 30,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/mainIcon.png"),
                      fit: BoxFit.fill)),
            ),
            Text(
              "Yakıt Asistan",
              style: TextStyleHelper.loginAppNameTitleStyle,
            )
          ],
        ),
      ),
    );
  }
}

class LoginRegisterSubtitle extends StatelessWidget {
  const LoginRegisterSubtitle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleHelper.loginWelcomeStyle,
    );
  }
}
