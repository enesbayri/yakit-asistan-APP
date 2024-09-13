import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class TripCardContent extends StatelessWidget {
  const TripCardContent({
    super.key,
    required this.from,
    required this.dist,
    required this.to,
    required this.consump,
    required this.spendFuel,
  });

  final String from;
  final int dist;
  final String to;
  final double consump;
  final int spendFuel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(
                    child: SizedBox(
                  height: 20,
                )),
                Flexible(
                    child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 11, right: 15),
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorUiHelper.appSecondColor),
                    ),
                    Text(
                      from,
                      style: TextStyleHelper.tripsCardSubtitleStyle,
                    ),
                  ],
                )),
                Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 8, bottom: 4, top: 4),
                  height: 10,
                  width: 5,
                  decoration: BoxDecoration(color: ColorUiHelper.appBgColor),
                ),
                Row(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 16, right: 8, bottom: 4),
                      height: 10,
                      width: 5,
                      decoration:
                          BoxDecoration(color: ColorUiHelper.appBgColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$dist km",
                      style: TextStyleHelper.tripsCardSubtitleStyle,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 8, bottom: 4),
                  height: 10,
                  width: 5,
                  decoration: BoxDecoration(color: ColorUiHelper.appBgColor),
                ),
                Flexible(
                    child: Row(
                  children: [
                    Icon(
                      Icons.share_location_rounded,
                      size: 32,
                      color: ColorUiHelper.appSecondColor,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Text(
                        to,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleHelper.tripsCardTitleStyle,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: ColorUiHelper.appBgColor, width: 2))),
              child: Column(children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorUiHelper.appBgColor, width: 2))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tüketim",
                              style: TextStyleHelper.tripsCardSubtitleStyle,
                            ),
                            Icon(
                              Icons.motion_photos_off_outlined,
                              color: ColorUiHelper.appSecondColor,
                              size: 26,
                            ),
                            Text(
                              consump.toStringAsFixed(2),
                              style: TextStyleHelper.tripsCardTitleStyle,
                            )
                          ]),
                    )),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_gas_station_rounded,
                              color: ColorUiHelper.appSecondColor,
                              size: 26,
                            ),
                            Text(
                              "Yakıt",
                              style: TextStyleHelper.tripsCardSubtitleStyle,
                            ),
                            Text(
                              "$spendFuel L",
                              style: TextStyleHelper.tripsCardTitleStyle,
                            )
                          ]),
                    ))
              ]),
            ))
      ],
    );
  }
}
