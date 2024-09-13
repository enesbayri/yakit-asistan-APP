import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class TripsFilterCarCard extends StatelessWidget {
  const TripsFilterCarCard({
    super.key,
    required this.carImgUrl,
    required this.isSelectedCard,
  });

  final String carImgUrl;
  final bool isSelectedCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: ColorUiHelper.appMainColor,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
            width: 1,
            color: (isSelectedCard)
                ? ColorUiHelper.appSecondColor
                : ColorUiHelper.appMainColor),
        image: DecorationImage(
            image:
                (carImgUrl == "" || carImgUrl == "assets/icons/addCarIcon.png")
                    ? const AssetImage("assets/cars/car.jpg")
                    : (carImgUrl.contains("https") == true
                        ? NetworkImage(carImgUrl) as ImageProvider
                        : FileImage(File(carImgUrl))),
            fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: (isSelectedCard)
                  ? ColorUiHelper.appSecondColor
                  : ColorUiHelper.appMainColor,
              spreadRadius: (isSelectedCard) ? 1 : 0.1,
              blurRadius: (isSelectedCard) ? 7 : 5,
              offset: const Offset(0, 3)),
        ],
      ),
    );
  }
}
