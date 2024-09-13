// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class PageMenuAnimation extends StatelessWidget {
  const PageMenuAnimation({super.key, required this.content});

  final content;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AnimationControll.controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(
            AnimationControll.sequenceAnimation["translatePage"].value, 0),
        child: Transform.scale(
          scale: AnimationControll.sequenceAnimation["scalePage"].value,
          child: Container(
            decoration: BoxDecoration(
                color: ColorUiHelper.appBgColor,
                borderRadius: AnimationControll
                    .sequenceAnimation["borderRadiusPage"].value,
                boxShadow: [
                  BoxShadow(
                      color: ColorUiHelper.appSecondColor,
                      blurRadius: 10,
                      spreadRadius: 5)
                ]),
            clipBehavior: Clip.antiAlias,
            child: content,
          ),
        ),
      ),
    );
  }
}
