import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class AddCarNameInput extends ConsumerWidget {
  AddCarNameInput({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: screen.width,
      height: 50,
      child: TextField(
        controller: TextControllerHelper.addCarNameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide:
                  BorderSide(color: ColorUiHelper.appMainColor, width: 2)),
          prefixIcon: Icon(
            Icons.drive_eta_rounded,
            size: 36,
            color: ColorUiHelper.appMainColor,
          ),
          label:
              Text("Araç Adı", style: TextStyleHelper.myCarsSortButtonsStyle),
          labelStyle: TextStyleHelper.textInputStyle,
        ),
        style: TextStyleHelper.textInputStyle,
      ),
    );
  }
}
