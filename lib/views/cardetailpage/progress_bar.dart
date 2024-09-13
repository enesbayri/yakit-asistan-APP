import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/cardetailpage/consump_bar_item.dart';

class FuelConsumpProgressBar extends StatelessWidget {
  const FuelConsumpProgressBar({
    super.key,
    required this.consump,
  });

  final double consump;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Ortalama Tüketim",
          style: TextStyleHelper.fuelConsumpBarTitleStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "L/100 : ",
              style: TextStyleHelper.fuelConsumpBarTitleStyle,
            ),
            FuelConsumpBarItem(
              consump: consump,
              min: 0,
              max: 20,
              leftItem: true,
            ),
            Container(
              width: 5,
              height: 30,
              color: Colors.transparent,
            ),
            FuelConsumpBarItem(
              consump: consump,
              min: 20,
              max: 40,
            ),
            Container(
              width: 5,
              height: 30,
              color: Colors.transparent,
            ),
            FuelConsumpBarItem(
              consump: consump,
              min: 40,
              max: 60,
              centerItem: true,
            ),
            Container(
              width: 5,
              height: 30,
              color: Colors.transparent,
            ),
            FuelConsumpBarItem(consump: consump, min: 60, max: 80),
            Container(
              width: 5,
              height: 30,
              color: Colors.transparent,
            ),
            FuelConsumpBarItem(
              consump: consump,
              min: 80,
              max: 100,
              rightItem: true,
            ),
          ],
        )
      ],
    );
  }
}
