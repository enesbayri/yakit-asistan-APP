import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/page_name_bar.dart';
import 'package:yakit_asistan/views/profilepage/logout_button.dart';
import 'package:yakit_asistan/views/profilepage/profile_detail_card.dart';
import 'package:yakit_asistan/views/profilepage/updateprofile/update_profile_info.dart';

class MyProfileContent extends StatefulWidget {
  const MyProfileContent({
    super.key,
  });

  @override
  State<MyProfileContent> createState() => _MyProfileContentState();
}

class _MyProfileContentState extends State<MyProfileContent>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    createAnimation();
  }

  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0,
              top: 0,
              child: PageNameBar(
                pageName: "Profilim",
                color: ColorUiHelper.appMainColor,
                width: screen.width * 0.4,
              )),
          ProfileDetailCard(),
          const UpdateProfileInfo(),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: LogOutButton(),
            ),
          )
        ],
      ),
    );
  }

  void createAnimation() {
    AnimationControll.createProfilePageAnimation(this, context);
  }

  @override
  void dispose() {
    AnimationControll.profileDispose();
    super.dispose();
  }
}
