import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class CarListTitle extends StatelessWidget {
  const CarListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 4),
        child: Icon(
          Icons.car_repair,
          color: ColorUiHelper.appMainColor,
          size: 24,
        ),
      ),
      Text("Araçlarım",
          overflow: TextOverflow.ellipsis,
          style: TextStyleHelper.profileDetailsStyle),
      Expanded(
        child: Container(
          height: 2,
          margin: const EdgeInsets.only(left: 4),
          color: ColorUiHelper.appMainColor,
        ),
      ),
    ]);
  }
}
