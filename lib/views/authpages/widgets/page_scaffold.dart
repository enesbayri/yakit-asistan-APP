// ignore_for_file: must_be_immutable

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/authpages/widgets/phone_bg.dart';

class LoginRegisterPagesScaffold extends StatelessWidget {
  LoginRegisterPagesScaffold({super.key, this.child});
  final Widget? child;

  int randomImage = Random().nextInt(4) + 1;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    debugPrint("Tetikteeeeeee");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: screen.width,
        height: screen.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/loginbg/$randomImage.png"),
              fit: BoxFit.fill),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Stack(
            children: [
              LoginRegisterPhoneBG(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
