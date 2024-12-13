import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class ProfileCarInfoCard extends StatelessWidget {
  ProfileCarInfoCard({
    super.key,
    required this.carName,
    required this.imgUrl,
  });

  final String carName;
  final String imgUrl;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              height: 100,
              width: screen.width * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: (imgUrl == "" ||
                            imgUrl.contains("assets"))
                        ? const AssetImage("assets/cars/car.jpg")
                        : (imgUrl.contains("https") == true
                            ? NetworkImage(imgUrl) as ImageProvider
                            : FileImage(File(imgUrl))),
                    fit: BoxFit.fill,
                    opacity: 0.9),
              ),
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: ColorUiHelper.appMainColor,
                  blurRadius: 20,
                  spreadRadius: 0.5)
            ]),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.drive_eta,
                  color: ColorUiHelper.appBgColor,
                  size: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(carName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleHelper.profileCarNameStyle),
              ],
            )),
      ],
    );
  }
}
