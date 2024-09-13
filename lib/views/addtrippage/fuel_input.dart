import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/addtrippage/from_to_input.dart';

class AddTripFuelInput extends StatelessWidget {
  const AddTripFuelInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: ColorUiHelper.appBgColor, width: 2))),
          child: Column(children: [
            Flexible(
                flex: 1,
                child: SizedBox(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_gas_station_rounded,
                          color: ColorUiHelper.appSecondColor,
                          size: 36,
                        ),
                        Text(
                          "Yakıt",
                          style: TextStyleHelper.tripsCardSubtitleStyle,
                        ),
                        AddTripFromToInput(
                          icon: Icons.local_gas_station_rounded,
                          label: "L",
                          controller: TextControllerHelper.addTripPageFuel,
                          width: 120,
                          height: 40,
                          isNumber: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Harcanan yakıt",
                            style: TextStyleHelper.fuelInputSubtitleStyle,
                          ),
                        )
                      ]),
                ))
          ]),
        ));
  }
}
