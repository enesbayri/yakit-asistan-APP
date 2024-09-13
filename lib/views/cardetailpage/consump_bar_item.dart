// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class FuelConsumpBarItem extends StatelessWidget {
  FuelConsumpBarItem(
      {super.key,
      required this.consump,
      required this.min,
      required this.max,
      this.leftItem,
      this.rightItem,
      this.centerItem});

  final double consump;
  final int min;
  final int max;
  bool? leftItem = false;
  bool? rightItem = false;
  bool? centerItem = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: rightItem == true
            ? const BorderRadius.only(
                topRight: Radius.circular(12), bottomRight: Radius.circular(12))
            : leftItem == true
                ? const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))
                : BorderRadius.zero,
        boxShadow: [
          BoxShadow(
              color: ColorUiHelper.appMainColor,
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 30,
            width: 50,
            child: LinearProgressIndicator(
                backgroundColor: ColorUiHelper.appMainColor,
                color: ColorUiHelper.appSecondColor,
                value: (consump > min && consump <= max)
                    ? (consump - min) / 20
                    : (consump > max)
                        ? 1
                        : 0,
                borderRadius: rightItem == true
                    ? const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12))
                    : leftItem == true
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12))
                        : BorderRadius.zero),
          ),
          centerItem == true
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    consump.toStringAsFixed(2),
                    style: TextStyleHelper.fuelConsumpBarStyle,
                    textScaler: const TextScaler.linear(0.8),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
