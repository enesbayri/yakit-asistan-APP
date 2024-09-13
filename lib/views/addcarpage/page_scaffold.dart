import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/addcarpage/add_car_card.dart';
import 'package:yakit_asistan/views/addcarpage/add_car_img.dart';
import 'package:yakit_asistan/views/commonwidgets/appbar.dart';

class AddCarPageScaffold extends StatelessWidget {
  AddCarPageScaffold({
    super.key,
  });

  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUiHelper.appMainColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Appbar.getAddPageAppBar,
          Positioned(
              child: SizedBox(
            height: screen.height / 10 * 6,
            width: screen.width,
          )),
          Positioned(
            left: screen.width / 2 - 90,
            top: screen.height / 10 * 2,
            child: const AddCarImgButton(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AddCarCard(),
          )
        ],
      ),
    );
  }
}
