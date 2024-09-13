import 'package:flutter/cupertino.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/addcarpage/add_button.dart';
import 'package:yakit_asistan/views/addcarpage/car_model_dropdown.dart';
import 'package:yakit_asistan/views/addcarpage/car_name_input.dart';
import 'package:yakit_asistan/views/addcarpage/car_type_dropdown.dart';
import 'package:yakit_asistan/views/addcarpage/fuel_radio.dart';
import 'package:yakit_asistan/views/addcarpage/transmission_radio.dart';

class AddCarForm extends StatelessWidget {
  const AddCarForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AddCarNameInput(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AddCarFuelRadio(),
                Flexible(
                  child: Container(
                    width: 4,
                    height: 60,
                    decoration: BoxDecoration(
                        color: ColorUiHelper.appMainColor,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                const AddCarTransmissionRadio()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AddCarModelYearDropDown(),
                AddCarTypeDrowDown(),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(12), child: AddCarButton()),
        ],
      ),
    );
  }
}
