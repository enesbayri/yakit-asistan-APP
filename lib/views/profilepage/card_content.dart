import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/profilepage/car_list.dart';

class ProfileCardContent extends ConsumerWidget {
  ProfileCardContent({
    super.key,
  });
  final AuthService auth = locator<AuthService>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24)),
          color: ColorUiHelper.appBgColor,
          boxShadow: [
            BoxShadow(
                color: ColorUiHelper.appMainColor,
                offset: const Offset(0, 5),
                blurRadius: 5,
                spreadRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              ref.read(updateProfileProvider.notifier).state = 0;
              AnimationControll.profileController.forward();
            },
            splashColor: ColorUiHelper.appSecondColor,
            child: ListTile(
              leading: Icon(
                Icons.mail,
                color: ColorUiHelper.appMainColor,
                size: 24,
              ),
              title: StreamBuilder(
                  stream: auth.getEmailStream(),
                  builder: (context, snapshot) => Text(
                      snapshot.hasData ? snapshot.data! : "Yakıt Asistan",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleHelper.profileDetailsStyle)),
            ),
          ),
          InkWell(
            onTap: () {
              ref.read(updateProfileProvider.notifier).state = 1;
              AnimationControll.profileController.forward();
            },
            splashColor: ColorUiHelper.appSecondColor,
            child: ListTile(
              leading: Icon(
                Icons.key,
                color: ColorUiHelper.appMainColor,
                size: 24,
              ),
              title: Text("* * * * * *",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleHelper.profileDetailsStyle),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ProfilePageCarList()
        ],
      ),
    );
  }
}
