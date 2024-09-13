import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/views/addtrippage/from_to_input.dart';

class AddTripDistInput extends StatelessWidget {
  const AddTripDistInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 8, bottom: 4),
          height: 10,
          width: 5,
          decoration: BoxDecoration(color: ColorUiHelper.appBgColor),
        ),
        AddTripFromToInput(
          icon: Icons.add_road_sharp,
          label: "KM",
          controller: TextControllerHelper.addTripPageDist,
          height: 30,
          width: 175,
          isNumber: true,
        )
      ],
    ));
  }
}
