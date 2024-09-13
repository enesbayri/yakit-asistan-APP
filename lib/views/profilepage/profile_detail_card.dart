import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/profilepage/card_content.dart';
import 'package:yakit_asistan/views/profilepage/card_header.dart';

class ProfileDetailCard extends StatelessWidget {
  ProfileDetailCard({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width * 0.8,
      height: screen.height * 0.7,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: ProfileCardHeader(),
          ),
          Expanded(
            flex: 6,
            child: ProfileCardContent(),
          )
        ],
      ),
    );
  }
}
