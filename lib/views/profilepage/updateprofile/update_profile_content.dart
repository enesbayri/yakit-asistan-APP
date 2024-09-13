import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/profilepage/updateprofile/update_card.dart';

class UpdateProfileInfoContent extends StatelessWidget {
  UpdateProfileInfoContent({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AnimationControll.profileController,
      builder: (context, child) => Align(
        alignment: Alignment.center,
        child: Transform.translate(
          offset: Offset(
              0,
              AnimationControll
                  .profileSequenceAnimation["phonePosition"].value),
          child: Transform.scale(
            scale:
                AnimationControll.profileSequenceAnimation["phoneScale"].value,
            child: Container(
              width: screen.width * 0.85,
              height: screen.height * 0.85,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/loginbg/phone.png"),
                      fit: BoxFit.fill)),
              child: const UpdateProfileCardContent(),
            ),
          ),
        ),
      ),
    );
  }
}
