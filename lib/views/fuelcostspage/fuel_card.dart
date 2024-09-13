import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/fuelcostspage/card_content.dart';
import 'package:yakit_asistan/views/fuelcostspage/card_header.dart';
import 'package:yakit_asistan/views/fuelcostspage/card_icon.dart';

class FuelCard extends StatelessWidget {
  FuelCard({
    super.key,
    required this.mainColor,
    required this.secondColor,
    required this.imgUrl,
    required this.typeToCostList,
    required this.title,
    required this.imgBgColor,
  });

  final Color mainColor;
  final Color secondColor;
  final String imgUrl;
  final Color imgBgColor;
  final List typeToCostList;
  final String title;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: screen.width,
          height: 190,
        ),
        Positioned(
          left: 25,
          top: 35,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("FuelDetailPage",
                  arguments: {"company": title, "color": mainColor});
            },
            child: Container(
              width: screen.width - 50,
              height: 150,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(width: 5, color: secondColor),
                image: const DecorationImage(
                    image: AssetImage("assets/icons/mainIcon.png"),
                    opacity: 0.1),
                boxShadow: [
                  BoxShadow(
                      color: mainColor.withOpacity(0.5),
                      spreadRadius: 7,
                      blurRadius: 10,
                      offset: const Offset(0, 3)),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FuelCardContent(
                          type: typeToCostList[0]["type"],
                          cost: typeToCostList[0]["cost"]),
                      const SizedBox(
                        width: 10,
                      ),
                      FuelCardContent(
                          type: typeToCostList[1]["type"],
                          cost: typeToCostList[1]["cost"]),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    FuelCardContent(
                        type: typeToCostList[2]["type"],
                        cost: typeToCostList[2]["cost"]),
                    const SizedBox(
                      width: 10,
                    ),
                    FuelCardContent(
                        type: typeToCostList[3]["type"],
                        cost: typeToCostList[3]["cost"]),
                  ]),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 10,
            left: 60,
            child: FuelCardHeader(
              title: title,
              borderColor: secondColor,
            )),
        Positioned(
            left: 10,
            top: 5,
            child: FuelCardIcon(url: imgUrl, imgBgColor: imgBgColor)),
      ],
    );
  }
}
