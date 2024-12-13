import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';

class CarDetailBackground extends ConsumerWidget {
  CarDetailBackground({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Car car = ref.read(detailPageSelectedCarProvider);
    return Hero(
      tag: car.name,
      child: Container(
        width: screen.width,
        height: screen.height / 10 * 6,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: (car.imageUrl == "" ||
                      car.imageUrl.contains("assets"))
                  ? const AssetImage("assets/cars/car.jpg")
                  : (car.imageUrl.contains("https") == true
                      ? NetworkImage(car.imageUrl) as ImageProvider
                      : FileImage(File(car.imageUrl))),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
