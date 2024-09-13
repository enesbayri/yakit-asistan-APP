import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/cardetailpage/back_button.dart';
import 'package:yakit_asistan/views/cardetailpage/car_details.dart';
import 'package:yakit_asistan/views/cardetailpage/delete_button.dart';
import 'package:yakit_asistan/views/cardetailpage/edit_button.dart';
import 'package:yakit_asistan/views/cardetailpage/name_box.dart';
import 'package:yakit_asistan/views/cardetailpage/page_bg.dart';

class CarDetailPageScaffold extends StatelessWidget {
  CarDetailPageScaffold({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SizedBox(
          width: screen.width,
          height: screen.height,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CarDetailBackground(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CarDetails(),
        ),
        const Positioned(
          left: 18,
          top: 30,
          child: CarDetailBackButton(),
        ),
        const Positioned(
          left: 20,
          top: 90,
          child: CarDetailEditButton(),
        ),
        const Positioned(
          left: 20,
          top: 145,
          child: CarDetailDeleteButton(),
        ),
        Positioned(
          right: 15,
          top: 35,
          child: CarDetailNameBox(),
        )
      ]),
    );
  }
}
