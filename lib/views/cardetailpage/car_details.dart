import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/cardetailpage/detail_card_content.dart';
import 'package:yakit_asistan/views/cardetailpage/progress_bar.dart';

class CarDetails extends ConsumerWidget {
  CarDetails({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Car car = ref.read(detailPageSelectedCarProvider);
    return Container(
      width: screen.width,
      height: screen.height / 10 * 4.5,
      decoration: BoxDecoration(
        color: ColorUiHelper.appBgColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
              color: ColorUiHelper.appMainColor.withOpacity(1),
              spreadRadius: 0.1,
              blurRadius: 5,
              offset: const Offset(0, -3)),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 5,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: ColorUiHelper.appMainColor,
                borderRadius: BorderRadius.circular(24)),
          ),
          FuelConsumpProgressBar(consump: car.consump),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CarDetailContentCard(
                icon: Icon(
                  Icons.drive_eta_outlined,
                  color: ColorUiHelper.appSecondColor,
                  size: 36,
                ),
                title: car.model.toString(),
              ),
              CarDetailContentCard(
                icon: Icon(
                  Icons.commute_sharp,
                  color: ColorUiHelper.appSecondColor,
                  size: 36,
                ),
                title: car.type,
              ),
              CarDetailContentCard(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Image.asset(
                    "assets/icons/transmission.png",
                    height: 28,
                    fit: BoxFit.cover,
                  ),
                ),
                title: car.transmission,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CarDetailContentCard(
                icon: Icon(
                  Icons.local_gas_station_rounded,
                  color: ColorUiHelper.appSecondColor,
                  size: 36,
                ),
                title: car.fuel,
              ),
              CarDetailContentCard(
                icon: Icon(
                  Icons.add_road,
                  color: ColorUiHelper.appSecondColor,
                  size: 36,
                ),
                title: car.totalDist.toString(),
              ),
              CarDetailContentCard(
                icon: Icon(
                  Icons.motion_photos_off_outlined,
                  color: ColorUiHelper.appSecondColor,
                  size: 36,
                ),
                title: "${car.consump.toStringAsFixed(2)} l/100",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
