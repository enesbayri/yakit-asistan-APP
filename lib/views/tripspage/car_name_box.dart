import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class TripCardCarNameBox extends StatelessWidget {
  TripCardCarNameBox({
    super.key,
    required this.carName,
  });

  final String carName;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (screen.width - 20) / 2,
      height: 25,
      decoration: BoxDecoration(
        color: ColorUiHelper.appBgColor,
        borderRadius: BorderRadius.circular(16),
        //border: Border.all(color: ColorUiHelper.appMainColor)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 4.0),
            child: Icon(
              Icons.drive_eta,
              size: 24,
              color: ColorUiHelper.appMainColor,
            ),
          ),
          Flexible(
              child: Text(
            carName,
            overflow: TextOverflow.ellipsis,
            style: TextStyleHelper.tripsCarName,
          ))
        ],
      ),
    );
  }
}
