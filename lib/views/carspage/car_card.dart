import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/carspage/text_with_icon.dart';

class MyCarCard extends StatelessWidget {
  MyCarCard({
    super.key,
    required this.carName,
    required this.fuelType,
    required this.transmission,
    required this.modelYear,
    required this.avgCons,
    required this.carImg,
  });

  final String carName;
  final String fuelType;
  final String transmission;
  final int modelYear;
  final double avgCons;
  final String carImg;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width - 5,
      height: 100,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: ColorUiHelper.appMainColor,
        borderRadius: BorderRadius.circular(32),
        border:
            Border.all(width: 1, color: ColorUiHelper.calcutesBoxBorderColor),
        image: const DecorationImage(
            image: AssetImage("assets/icons/mainIcon.png"),
            opacity: 0.1,
            alignment: Alignment.centerRight),
        boxShadow: [
          BoxShadow(
              color: ColorUiHelper.appMainColor.withOpacity(1),
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      carName,
                      style: TextStyleHelper.calcutesCardTitleStyle,
                    ),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CarsPageTextWithIcon(
                        icon: Icon(Icons.local_gas_station_rounded,
                            color: ColorUiHelper.appSecondColor),
                        title: fuelType,
                      ),
                      CarsPageTextWithIcon(
                        icon: Icon(Icons.motion_photos_off_outlined,
                            color: ColorUiHelper.appSecondColor),
                        title:
                            "${avgCons >= 100 ? avgCons.toStringAsFixed(0) : avgCons.toStringAsFixed(2)} l/100",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CarsPageTextWithIcon(
                        icon: Image.asset("assets/icons/transmission.png"),
                        title: transmission,
                      ),
                      CarsPageTextWithIcon(
                        icon: Icon(Icons.drive_eta_outlined,
                            color: ColorUiHelper.appSecondColor),
                        title: modelYear.toString(),
                      ),
                    ],
                  )
                  //CarsPageTextWithIcon(icon: ,title: "Benzin",),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Hero(
                  tag: carName,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        image: DecorationImage(
                            image: (carImg == "" ||
                                    carImg == "" 'assets/icons/addCarIcon.png')
                                ? const AssetImage("assets/cars/car.jpg")
                                : (carImg.contains("https") == true
                                    ? NetworkImage(carImg) as ImageProvider
                                    : FileImage(File(carImg))),
                            fit: BoxFit.cover)),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
