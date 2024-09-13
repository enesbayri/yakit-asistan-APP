import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/views/addtrippage/from_to_input.dart';

class AddTripToInput extends StatelessWidget {
  const AddTripToInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
      children: [
        Icon(
          Icons.share_location_rounded,
          size: 46,
          color: ColorUiHelper.appSecondColor,
        ),
        const SizedBox(
          width: 7,
        ),
        AddTripFromToInput(
          icon: Icons.location_on,
          label: "Nereye",
          controller: TextControllerHelper.addTripPageTo,
          width: 200,
          height: 40,
          isNumber: false,
        )
      ],
    ));
  }
}
