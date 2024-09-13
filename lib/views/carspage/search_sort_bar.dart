import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/carspage/car_name_input.dart';
import 'package:yakit_asistan/views/carspage/sort_bar.dart';

class MyCarsSearchAndSortBar extends StatelessWidget {
  MyCarsSearchAndSortBar({super.key});
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width,
      child: const Column(children: [
        CarNameInput(),
        SizedBox(
          height: 5,
        ),
        CarsSortBar(),
      ]),
    );
  }
}
