import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/fuelcostspage/card_header.dart';
import 'package:yakit_asistan/views/fuelcostspage/card_icon.dart';

class FuelLoadingCard extends StatelessWidget {
  FuelLoadingCard({
    super.key,
    required this.mainColor,
    required this.secondColor,
    required this.imgUrl,
    required this.title,
    required this.imgBgColor,
  });

  final Color mainColor;
  final Color secondColor;
  final String imgUrl;
  final Color imgBgColor;
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: secondColor),
                      const Text("Fiyatlar yükleniyor...")
                    ])),
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
