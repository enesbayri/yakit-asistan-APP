import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class UpdateProfileCardTitle extends StatelessWidget {
  const UpdateProfileCardTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
