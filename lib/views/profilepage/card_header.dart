import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/profilepage/profile_img.dart';

class ProfileCardHeader extends ConsumerWidget {
  ProfileCardHeader({
    super.key,
  });

  final AuthService auth = locator<AuthService>();
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        color: ColorUiHelper.appMainColor.withOpacity(0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: screen.width * 0.8,
          ),
          const ProfileImage(),
          InkWell(
              onTap: () {
                ref.read(updateProfileProvider.notifier).state = 2;
                AnimationControll.profileController.forward();
              },
              splashColor: ColorUiHelper.appSecondColor,
              child: SizedBox(
                  child: StreamBuilder(
                      stream: auth.getUsernameStream(),
                      builder: (context, snapshot) => Text(
                            snapshot.hasData ? snapshot.data! : "Yakıt Asistan",
                            style: TextStyleHelper.profileNameStyle,
                          )))),
        ],
      ),
    );
  }
}
