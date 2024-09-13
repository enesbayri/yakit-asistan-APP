import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class CarNameInput extends ConsumerWidget {
  const CarNameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 2),
      child: SizedBox(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
              label: Text("Araçlarım",
                  style: TextStyleHelper.myCarsSortButtonsStyle),
              labelStyle: TextStyleHelper.textInputStyle,
              prefixIcon: Icon(
                Icons.directions_car_filled_rounded,
                color: ColorUiHelper.appMainColor,
                size: 30,
              )),
          style: TextStyleHelper.textInputStyle,
          onChanged: (value) {
            ref.read(myCarsPageNameInputProvider.notifier).state = value;
          },
        ),
      ),
    );
  }
}
