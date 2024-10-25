// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/user_location.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/fuelcostspage/fuel_card.dart';
import 'package:yakit_asistan/views/fuelcostspage/fuel_loading_card.dart';

class FuelCostsStateRouter extends StatelessWidget {
  FuelCostsStateRouter({
    super.key,
    this.costs,
    required this.isLoading,
  });
  Map<String, Map>? costs;
  final bool isLoading;

  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: screen.width,
          height: 50,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.local_gas_station_rounded,
                  color: ColorUiHelper.appMainColor,
                  size: 32,
                ),
              ),
              Text(
                "Akaryakıt Fiyatları",
                style: TextStyleHelper.cardHeaderStyle,
              )
            ],
          ),
        ),
        isLoading == true
            ? FuelLoadingCard(
                title: "SHELL",
                imgUrl: "assets/shell.png",
                imgBgColor: ColorUiHelper.shellImgBgColor,
                mainColor: ColorUiHelper.shellMainColor,
                secondColor: ColorUiHelper.shellSecondColor,
              )
            : FuelCard(
                title: "SHELL",
                imgUrl: "assets/shell.png",
                imgBgColor: ColorUiHelper.shellImgBgColor,
                mainColor: ColorUiHelper.shellMainColor,
                secondColor: ColorUiHelper.shellSecondColor,
                typeToCostList: [
                  {
                    "type": "Benzin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["shell"] == null)
                        ? "00.00"
                        : (costs!["shell"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["shell"]!["ankara"] == null ? costs!["shell"]!["adana"][0] : costs!["shell"]!["ankara"][0])
                            : costs!["shell"]![
                                UserLocation.userPlace.toLowerCase()][0])
                  },
                  {
                    "type": "Motorin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["shell"] == null)
                        ? "00.00"
                        : (costs!["shell"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["shell"]!["ankara"] == null ? costs!["shell"]!["adana"][1] : costs!["shell"]!["ankara"][1])
                            : costs!["shell"]![
                                UserLocation.userPlace.toLowerCase()][1])
                  },
                  {
                    "type": "Motorin+",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["shell"] == null)
                        ? "00.00"
                        : (costs!["shell"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["shell"]!["ankara"] == null ? costs!["shell"]!["adana"][2] : costs!["shell"]!["ankara"][2])
                            : costs!["shell"]![
                                UserLocation.userPlace.toLowerCase()][2])
                  },
                  {
                    "type": "Otogaz",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["shell"] == null)
                        ? "00.00"
                        : (costs!["shell"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["shell"]!["ankara"] == null ? costs!["shell"]!["adana"][3] : costs!["shell"]!["ankara"][3])
                            : costs!["shell"]![
                                UserLocation.userPlace.toLowerCase()][3])
                  },
                ],
              ),
        const SizedBox(
          height: 30,
        ),
        isLoading == true
            ? FuelLoadingCard(
                title: "OPET",
                imgUrl: "assets/opet.png",
                imgBgColor: ColorUiHelper.opetImgBgColor,
                mainColor: ColorUiHelper.opetMainColor,
                secondColor: ColorUiHelper.opetSecondColor,
              )
            : FuelCard(
                title: "OPET",
                imgUrl: "assets/opet.png",
                imgBgColor: ColorUiHelper.opetImgBgColor,
                mainColor: ColorUiHelper.opetMainColor,
                secondColor: ColorUiHelper.opetSecondColor,
                typeToCostList: [
                  {
                    "type": "Benzin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["opet"] == null)
                        ? "00.00"
                        : (costs!["opet"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["opet"]!["ankara"] == null ? costs!["opet"]!["adana"][0] : costs!["opet"]!["ankara"][0])
                            : costs!["opet"]![
                                UserLocation.userPlace.toLowerCase()][0])
                  },
                  {
                    "type": "Motorin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["opet"] == null)
                        ? "00.00"
                        : (costs!["opet"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["opet"]!["ankara"] == null ? costs!["opet"]!["adana"][1] : costs!["opet"]!["ankara"][1])
                            : costs!["opet"]![
                                UserLocation.userPlace.toLowerCase()][1])
                  },
                  {
                    "type": "Motorin+",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["opet"] == null)
                        ? "00.00"
                        : (costs!["opet"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["opet"]!["ankara"] == null ? costs!["opet"]!["adana"][2] : costs!["opet"]!["ankara"][2])
                            : costs!["opet"]![
                                UserLocation.userPlace.toLowerCase()][2])
                  },
                  {
                    "type": "Otogaz",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["opet"] == null)
                        ? "00.00"
                        : (costs!["opet"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["opet"]!["ankara"] == null ? costs!["opet"]!["adana"][3] : costs!["opet"]!["ankara"][3])
                            : costs!["opet"]![
                                UserLocation.userPlace.toLowerCase()][3])
                  },
                ],
              ),
        const SizedBox(
          height: 30,
        ),
        isLoading == true
            ? FuelLoadingCard(
                title: "SOİL",
                imgUrl: "assets/soil.png",
                imgBgColor: ColorUiHelper.soilImgBgColor,
                mainColor: ColorUiHelper.soilMainColor,
                secondColor: ColorUiHelper.soilSecondColor,
              )
            : FuelCard(
                title: "SOİL",
                imgUrl: "assets/soil.png",
                imgBgColor: ColorUiHelper.soilImgBgColor,
                mainColor: ColorUiHelper.soilMainColor,
                secondColor: ColorUiHelper.soilSecondColor,
                typeToCostList: [
                  {
                    "type": "Benzin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["soil"] == null)
                        ? "00.00"
                        : (costs!["soil"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["soil"]!["ankara"] == null ? costs!["soil"]!["adana"][0] : costs!["soil"]!["ankara"][0])
                            : costs!["soil"]![
                                UserLocation.userPlace.toLowerCase()][0])
                  },
                  {
                    "type": "Motorin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["soil"] == null)
                        ? "00.00"
                        : (costs!["soil"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["soil"]!["ankara"] == null ? costs!["soil"]!["adana"][1] : costs!["soil"]!["ankara"][1])
                            : costs!["soil"]![
                                UserLocation.userPlace.toLowerCase()][1])
                  },
                  {
                    "type": "Motorin+",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["soil"] == null)
                        ? "00.00"
                        : (costs!["soil"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["soil"]!["ankara"] == null ? costs!["soil"]!["adana"][2] : costs!["soil"]!["ankara"][2])
                            : costs!["soil"]![
                                UserLocation.userPlace.toLowerCase()][2])
                  },
                  {
                    "type": "Otogaz",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["soil"] == null)
                        ? "00.00"
                        : (costs!["soil"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["soil"]!["ankara"] == null ? costs!["soil"]!["adana"][3] : costs!["soil"]!["ankara"][3])
                            : costs!["soil"]![
                                UserLocation.userPlace.toLowerCase()][3])
                  },
                ],
              ),
        const SizedBox(
          height: 30,
        ),
        isLoading == true
            ? FuelLoadingCard(
                title: "GO",
                imgUrl: "assets/go.png",
                imgBgColor: ColorUiHelper.goImgBgColor,
                mainColor: ColorUiHelper.goMainColor,
                secondColor: ColorUiHelper.goSecondColor,
              )
            : FuelCard(
                title: "GO",
                imgUrl: "assets/go.png",
                imgBgColor: ColorUiHelper.goImgBgColor,
                mainColor: ColorUiHelper.goMainColor,
                secondColor: ColorUiHelper.goSecondColor,
                typeToCostList: [
                  {
                    "type": "Benzin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["go"] == null)
                        ? "00.00"
                        : (costs!["go"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["go"]!["ankara"] == null ? costs!["go"]!["adana"][0] : costs!["go"]!["ankara"][0])
                            : costs!["go"]![
                                UserLocation.userPlace.toLowerCase()][0])
                  },
                  {
                    "type": "Motorin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["go"] == null)
                        ? "00.00"
                        : (costs!["go"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["go"]!["ankara"] == null ? costs!["go"]!["adana"][1] : costs!["go"]!["ankara"][1])
                            : costs!["go"]![
                                UserLocation.userPlace.toLowerCase()][1])
                  },
                  {
                    "type": "Motorin+",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["go"] == null)
                        ? "00.00"
                        : (costs!["go"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["go"]!["ankara"] == null ? costs!["go"]!["adana"][2] : costs!["go"]!["ankara"][2])
                            : costs!["go"]![
                                UserLocation.userPlace.toLowerCase()][2])
                  },
                  {
                    "type": "Otogaz",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["go"] == null)
                        ? "00.00"
                        : (costs!["go"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["go"]!["ankara"] == null ? costs!["go"]!["adana"][3] : costs!["go"]!["ankara"][3])
                            : costs!["go"]![
                                UserLocation.userPlace.toLowerCase()][3])
                  },
                ],
              ),
        const SizedBox(
          height: 30,
        ),
        isLoading == true
            ? FuelLoadingCard(
                title: "PO",
                imgUrl: "assets/po.png",
                imgBgColor: ColorUiHelper.poImgBgColor,
                mainColor: ColorUiHelper.poMainColor,
                secondColor: ColorUiHelper.poSecondColor,
              )
            : FuelCard(
                title: "PO",
                imgUrl: "assets/po.png",
                imgBgColor: ColorUiHelper.poImgBgColor,
                mainColor: ColorUiHelper.poMainColor,
                secondColor: ColorUiHelper.poSecondColor,
                typeToCostList: [
                  {
                    "type": "Benzin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["po"] == null)
                        ? "00.00"
                        : (costs!["po"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["po"]!["ankara"] == null ? costs!["po"]!["adana"][0] : costs!["po"]!["ankara"][0])
                            : costs!["po"]![
                                UserLocation.userPlace.toLowerCase()][0])
                  },
                  {
                    "type": "Motorin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["po"] == null)
                        ? "00.00"
                        : (costs!["po"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["po"]!["ankara"] == null ? costs!["po"]!["adana"][1] : costs!["po"]!["ankara"][1])
                            : costs!["po"]![
                                UserLocation.userPlace.toLowerCase()][1])
                  },
                  {
                    "type": "Motorin+",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["po"] == null)
                        ? "00.00"
                        : (costs!["po"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["po"]!["ankara"] == null ? costs!["po"]!["adana"][2] : costs!["po"]!["ankara"][2])
                            : costs!["po"]![
                                UserLocation.userPlace.toLowerCase()][2])
                  },
                  {
                    "type": "Otogaz",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["po"] == null)
                        ? "00.00"
                        : (costs!["po"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["po"]!["ankara"] == null ? costs!["po"]!["adana"][3] : costs!["po"]!["ankara"][3])
                            : costs!["po"]![
                                UserLocation.userPlace.toLowerCase()][3])
                  },
                ],
              ),
        const SizedBox(
          height: 30,
        ),
        isLoading == true
            ? FuelLoadingCard(
                title: "TP",
                imgUrl: "assets/tp.png",
                imgBgColor: ColorUiHelper.tpImgBgColor,
                mainColor: ColorUiHelper.tpMainColor,
                secondColor: ColorUiHelper.tpSecondColor,
              )
            : FuelCard(
                title: "TP",
                imgUrl: "assets/tp.png",
                imgBgColor: ColorUiHelper.tpImgBgColor,
                mainColor: ColorUiHelper.tpMainColor,
                secondColor: ColorUiHelper.tpSecondColor,
                typeToCostList: [
                  {
                    "type": "Benzin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["tp"] == null)
                        ? "00.00"
                        : (costs!["tp"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["tp"]!["ankara"] == null ? costs!["tp"]!["adana"][0] : costs!["tp"]!["ankara"][0])
                            : costs!["tp"]![
                                UserLocation.userPlace.toLowerCase()][0])
                  },
                  {
                    "type": "Motorin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["tp"] == null)
                        ? "00.00"
                        : (costs!["tp"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["tp"]!["ankara"] == null ? costs!["tp"]!["adana"][1] : costs!["tp"]!["ankara"][1])
                            : costs!["tp"]![
                                UserLocation.userPlace.toLowerCase()][1])
                  },
                  {
                    "type": "Motorin+",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["tp"] == null)
                        ? "00.00"
                        : (costs!["tp"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["tp"]!["ankara"] == null ? costs!["tp"]!["adana"][2] : costs!["tp"]!["ankara"][2])
                            : costs!["tp"]![
                                UserLocation.userPlace.toLowerCase()][2])
                  },
                  {
                    "type": "Otogaz",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["tp"] == null)
                        ? "00.00"
                        : (costs!["tp"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["tp"]!["ankara"] == null ? costs!["tp"]!["adana"][3] : costs!["tp"]!["ankara"][3])
                            : costs!["tp"]![
                                UserLocation.userPlace.toLowerCase()][3])
                  },
                ],
              ),
        const SizedBox(
          height: 30,
        ),
        isLoading == true
            ? FuelLoadingCard(
                title: "MOİL",
                imgUrl: "assets/moil.png",
                imgBgColor: ColorUiHelper.moilImgBgColor,
                mainColor: ColorUiHelper.moilMainColor,
                secondColor: ColorUiHelper.moilSecondColor,
              )
            : FuelCard(
                title: "MOİL",
                imgUrl: "assets/moil.png",
                imgBgColor: ColorUiHelper.moilImgBgColor,
                mainColor: ColorUiHelper.moilMainColor,
                secondColor: ColorUiHelper.moilSecondColor,
                typeToCostList: [
                  {
                    "type": "Benzin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["moil"] == null)
                        ? "00.00"
                        : (costs!["moil"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["moil"]!["ankara"] == null ? costs!["moil"]!["adana"][0] : costs!["moil"]!["ankara"][0])
                            : costs!["moil"]![
                                UserLocation.userPlace.toLowerCase()][0])
                  },
                  {
                    "type": "Motorin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["moil"] == null)
                        ? "00.00"
                        : (costs!["moil"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["moil"]!["ankara"] == null ? costs!["moil"]!["adana"][1] : costs!["moil"]!["ankara"][1])
                            : costs!["moil"]![
                                UserLocation.userPlace.toLowerCase()][1])
                  },
                  {
                    "type": "Motorin+",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["moil"] == null)
                        ? "00.00"
                        : (costs!["moil"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["moil"]!["ankara"] == null ? costs!["moil"]!["adana"][2] : costs!["moil"]!["ankara"][2])
                            : costs!["moil"]![
                                UserLocation.userPlace.toLowerCase()][2])
                  },
                  {
                    "type": "Otogaz",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["moil"] == null)
                        ? "00.00"
                        : (costs!["moil"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["moil"]!["ankara"] == null ? costs!["moil"]!["adana"][3] : costs!["moil"]!["ankara"][3])
                            : costs!["moil"]![
                                UserLocation.userPlace.toLowerCase()][3])
                  },
                ],
              ),
        const SizedBox(
          height: 30,
        ),
        isLoading == true
            ? FuelLoadingCard(
                title: "AYTEMİZ",
                imgUrl: "assets/aytemiz.png",
                imgBgColor: ColorUiHelper.aytemizImgBgColor,
                mainColor: ColorUiHelper.aytemizMainColor,
                secondColor: ColorUiHelper.aytemizSecondColor,
              )
            : FuelCard(
                title: "AYTEMİZ",
                imgUrl: "assets/aytemiz.png",
                imgBgColor: ColorUiHelper.aytemizImgBgColor,
                mainColor: ColorUiHelper.aytemizMainColor,
                secondColor: ColorUiHelper.aytemizSecondColor,
                typeToCostList: [
                  {
                    "type": "Benzin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["aytemiz"] == null)
                        ? "00.00"
                        : (costs!["aytemiz"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["aytemiz"]!["ankara"] == null ? costs!["aytemiz"]!["adana"][0] : costs!["aytemiz"]!["ankara"][0])
                            : costs!["aytemiz"]![
                                UserLocation.userPlace.toLowerCase()][0])
                  },
                  {
                    "type": "Motorin",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["aytemiz"] == null)
                        ? "00.00"
                        : (costs!["aytemiz"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["aytemiz"]!["ankara"] == null ? costs!["aytemiz"]!["adana"][1] : costs!["aytemiz"]!["ankara"][1])
                            : costs!["aytemiz"]![
                                UserLocation.userPlace.toLowerCase()][1])
                  },
                  {
                    "type": "Motorin+",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["aytemiz"] == null)
                        ? "00.00"
                        : (costs!["aytemiz"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["aytemiz"]!["ankara"] == null ? costs!["aytemiz"]!["adana"][2] : costs!["aytemiz"]!["ankara"][2])
                            : costs!["aytemiz"]![
                                UserLocation.userPlace.toLowerCase()][2])
                  },
                  {
                    "type": "Otogaz",
                    "cost": (costs == null ||
                            costs!.isEmpty ||
                            costs!["aytemiz"] == null)
                        ? "00.00"
                        : (costs!["aytemiz"]![
                                    UserLocation.userPlace.toLowerCase()] ==
                                null
                            ? (costs!["aytemiz"]!["ankara"] == null ? costs!["aytemiz"]!["adana"][3] : costs!["aytemiz"]!["ankara"][3])
                            : costs!["aytemiz"]![
                                UserLocation.userPlace.toLowerCase()][3])
                  },
                ],
              ),
      ],
    );
  }
}
