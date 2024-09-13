import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class SyncSelectDBCard extends ConsumerWidget {
  const SyncSelectDBCard(
      {super.key,
      required this.imageUrl,
      required this.radius,
      required this.padding,
      required this.borderRadius,
      required this.dbTag,
      this.onPressed,
      this.isborder});

  final String imageUrl;
  final double radius;
  final double padding;
  final double borderRadius;
  final String dbTag;
  final VoidCallback? onPressed;
  final bool? isborder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? currentDB = ref.watch(syncCurrenDBProvider);

    AnimationControll.syncController.forward();
    AnimationControll.syncController.addStatusListener((durum) {
      if (durum == AnimationStatus.completed) {
        AnimationControll.syncController.reverse();
      } else if (durum == AnimationStatus.dismissed) {
        AnimationControll.syncController.forward();
      }
    });

    return (currentDB != null && currentDB == dbTag)
        ? AnimatedBuilder(
            animation: AnimationControll.syncController,
            builder: (context, child) => Transform.scale(
              scale: AnimationControll
                  .syncSequenceAnimation["currentDBScale"].value,
              child: cardContainer(
                  shadowRadius: AnimationControll
                      .syncSequenceAnimation["currentDBShadow"].value,
                  isSelected: true),
            ),
          )
        : cardContainer(shadowRadius: 10, isSelected: false);
  }

  Widget cardContainer(
      {required double shadowRadius, required bool isSelected}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: isborder == true
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                    color: isSelected
                        ? ColorUiHelper.syncPageCurrentborderColor
                        : ColorUiHelper.syncPageMainColor,
                    width: 3),
                boxShadow: [
                    BoxShadow(
                        color: isSelected
                            ? ColorUiHelper.syncPageCurrentShadowColor
                            : ColorUiHelper.syncPageSecondColor,
                        blurRadius: shadowRadius,
                        spreadRadius: shadowRadius)
                  ])
            : null,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: ColorUiHelper.appBgColor,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
