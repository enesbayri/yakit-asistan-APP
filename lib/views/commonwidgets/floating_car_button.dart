import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class FloatingActionButtonCarsPage extends ConsumerWidget {
  const FloatingActionButtonCarsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(addCarProvider.notifier).state.imageUrl =
            "assets/icons/addCarIcon.png";
        Navigator.of(context).pushNamed("AddCarPage");
      },
      shape: StadiumBorder(side: BorderSide(color: ColorUiHelper.appBgColor)),
      backgroundColor: ColorUiHelper.appMainColor,
      splashColor: ColorUiHelper.appSecondColor,
      tooltip: "Araç Ekle",
      heroTag: "add",
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          "assets/icons/addCarIcon.png",
          color: ColorUiHelper.appBgColor,
        ),
      ),
    );
  }
}
