import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/addtrippage/dist_input.dart';
import 'package:yakit_asistan/views/addtrippage/from_input.dart';
import 'package:yakit_asistan/views/addtrippage/fuel_input.dart';
import 'package:yakit_asistan/views/addtrippage/to_input.dart';

class AddTripCard extends StatelessWidget {
  AddTripCard({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width,
      height: screen.height * 0.32,
      decoration: BoxDecoration(
        color: ColorUiHelper.appMainColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
            topRight: Radius.circular(32)),
        border:
            Border.all(width: 1, color: ColorUiHelper.calcutesBoxBorderColor),
        //border: Border(bottom: BorderSide(width: 1, color: ColorUiHelper.calcutesBoxBorderColor),top: BorderSide(width: 1, color: ColorUiHelper.calcutesBoxBorderColor)),
        image: const DecorationImage(
            image: AssetImage("assets/icons/mainIcon.png"),
            opacity: 0.1,
            alignment: Alignment.centerRight),
        boxShadow: [
          BoxShadow(
              color: ColorUiHelper.appSecondColor.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AddTripFromInput(),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 8, bottom: 4, top: 2),
                    height: 10,
                    width: 5,
                    decoration: BoxDecoration(color: ColorUiHelper.appBgColor),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 8, bottom: 4),
                    height: 10,
                    width: 5,
                    decoration: BoxDecoration(color: ColorUiHelper.appBgColor),
                  ),
                  const AddTripDistInput(),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 8, bottom: 4),
                    height: 10,
                    width: 5,
                    decoration: BoxDecoration(color: ColorUiHelper.appBgColor),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 8, bottom: 4),
                    height: 10,
                    width: 5,
                    decoration: BoxDecoration(color: ColorUiHelper.appBgColor),
                  ),
                  const AddTripToInput(),
                ],
              ),
            ),
          ),
          const AddTripFuelInput()
        ],
      ),
    );
  }
}
