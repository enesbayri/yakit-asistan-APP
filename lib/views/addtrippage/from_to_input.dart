// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class AddTripFromToInput extends StatelessWidget {
  AddTripFromToInput(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon,
      required this.width,
      required this.height,
      required this.isNumber});

  final String label;
  final TextEditingController controller;
  final IconData icon;
  final double width;
  final double height;
  bool isNumber = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: ColorUiHelper.appBgColor.withOpacity(0.5),
        ),
        child: TextField(
          keyboardType: isNumber ? TextInputType.number : null,
          inputFormatters: isNumber
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : [],
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide:
                    BorderSide(color: ColorUiHelper.appSecondColor, width: 2)),
            prefixIcon: Icon(
              icon,
              size: 24,
              color: ColorUiHelper.appMainColor,
            ),
            floatingLabelStyle: TextStyleHelper.textInputLabelStyle,
            labelText: label,
            labelStyle: TextStyleHelper.textSecondInputStyle,
          ),
          style: TextStyleHelper.textSecondInputStyle,
        ),
      ),
    );
  }
}
