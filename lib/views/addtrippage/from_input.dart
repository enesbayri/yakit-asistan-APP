import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/views/addtrippage/from_to_input.dart';

class AddTripFromInput extends StatelessWidget {
  const AddTripFromInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 15),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: ColorUiHelper.appSecondColor),
        ),
        AddTripFromToInput(
          icon: Icons.gps_fixed_rounded,
          label: "Nereden",
          controller: TextControllerHelper.addTripPageFrom,
          height: 40,
          width: 200,
          isNumber: false,
        )
      ],
    ));
  }
}
