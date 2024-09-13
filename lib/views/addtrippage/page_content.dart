import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/addtrippage/add_button.dart';
import 'package:yakit_asistan/views/addtrippage/car_dropdown.dart';
import 'package:yakit_asistan/views/addtrippage/trip_card.dart';
import 'package:yakit_asistan/views/commonwidgets/appbar.dart';
import 'package:yakit_asistan/views/commonwidgets/back_button.dart';

class AddTripPageContent extends StatelessWidget {
  AddTripPageContent({super.key, required this.cars});
  final screen = locator<ScreenSizeHelper>();
  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUiHelper.appMainColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Appbar.getAddPageAppBar,
          SizedBox(
            height: screen.height,
            width: screen.width,
          ),
          Align(
            alignment: Alignment.center,
            child: AddTripCard(),
          ),
          Positioned(
            top: screen.height * 0.2,
            child: Row(children: [
              Icon(
                Icons.route_outlined,
                color: ColorUiHelper.appBgColor,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Seyahat Ekle",
                style: TextStyleHelper.addTripTitleStyle,
              )
            ]),
          ),
          Positioned(
            left: screen.width / 2 - 60,
            bottom: screen.height * 0.23,
            child: const AddTripButton(),
          ),
          Positioned(
            top: screen.height / 2 - (screen.height * 0.44 / 2),
            child: AddTripCarNameDropDown(cars: cars),
          ),
          Positioned(
            right: 5,
            top: 20,
            child: GoBackPageButton(
                icon: Icon(
              Icons.close_rounded,
              color: ColorUiHelper.appBgColor,
              size: 42,
            )),
          ),
        ],
      ),
    );
  }
}
