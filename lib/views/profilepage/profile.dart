import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yakit_asistan/views/profilepage/profile_content.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/loginbg/${Random().nextInt(4) + 1}.png"),
            fit: BoxFit.fill),
      ),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: const MyProfileContent()),
    );
  }
}
