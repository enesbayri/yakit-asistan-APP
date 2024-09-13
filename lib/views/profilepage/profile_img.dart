import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
              color: ColorUiHelper.profileImageborderColor, width: 2),
          shape: BoxShape.circle),
      child: const CircleAvatar(
        backgroundImage: AssetImage("assets/icons/fullicon.png"),
        radius: 64,
      ),
    ));
  }
}
