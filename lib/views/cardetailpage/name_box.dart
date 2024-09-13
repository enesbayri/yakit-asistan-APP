import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class CarDetailNameBox extends ConsumerWidget {
  CarDetailNameBox({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Car car = ref.read(detailPageSelectedCarProvider);
    return Container(
      constraints:
          BoxConstraints(maxWidth: screen.width / 3 * 2, maxHeight: 70),
      decoration: BoxDecoration(
        color: ColorUiHelper.appBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        car.name,
        overflow: TextOverflow.ellipsis,
        style: TextStyleHelper.fuelConsumpBarTitleStyle,
      ),
    );
  }
}
