import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class AddCarTransmissionRadio extends ConsumerStatefulWidget {
  const AddCarTransmissionRadio({
    super.key,
  });

  @override
  ConsumerState<AddCarTransmissionRadio> createState() =>
      _AddCarTransmissionRadioState();
}

class _AddCarTransmissionRadioState
    extends ConsumerState<AddCarTransmissionRadio> {
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    bool isEditted = ref.read(isEditCarProvider);
    return SizedBox(
      width: screen.width / 2 - 2,
      height: 60,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          "Vites Türü",
          style: TextStyleHelper.addCarInputsLabel,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Radio.adaptive(
                  activeColor: ColorUiHelper.appSecondColor,
                  value: "Manuel",
                  groupValue: isEditted
                      ? ref.read(detailPageSelectedCarProvider).transmission
                      : ref.read(addCarProvider.notifier).state.transmission,
                  onChanged: (value) {
                    isEditted
                        ? ref.read(detailPageSelectedCarProvider).transmission =
                            "Manuel"
                        : ref.read(addCarProvider.notifier).state.transmission =
                            "Manuel";
                    setState(() {});
                  },
                ),
                Text(
                  "Manuel",
                  style: TextStyleHelper.addCarInputName,
                )
              ],
            ),
            Column(
              children: [
                Radio.adaptive(
                  activeColor: ColorUiHelper.appSecondColor,
                  value: "Otomatik",
                  groupValue: isEditted
                      ? ref.read(detailPageSelectedCarProvider).transmission
                      : ref.read(addCarProvider.notifier).state.transmission,
                  onChanged: (value) {
                    isEditted
                        ? ref.read(detailPageSelectedCarProvider).transmission =
                            "Otomatik"
                        : ref.read(addCarProvider.notifier).state.transmission =
                            "Otomatik";
                    setState(() {});
                  },
                ),
                Text(
                  "Otomatik",
                  style: TextStyleHelper.addCarInputName,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
