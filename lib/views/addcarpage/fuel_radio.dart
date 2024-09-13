import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class AddCarFuelRadio extends ConsumerStatefulWidget {
  const AddCarFuelRadio({
    super.key,
  });

  @override
  ConsumerState<AddCarFuelRadio> createState() => _AddCarFuelRadioState();
}

class _AddCarFuelRadioState extends ConsumerState<AddCarFuelRadio> {
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
          "Yakıt Türü",
          style: TextStyleHelper.addCarInputsLabel,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Radio.adaptive(
                  activeColor: ColorUiHelper.appSecondColor,
                  value: "Benzin",
                  groupValue: isEditted
                      ? ref.read(detailPageSelectedCarProvider).fuel
                      : ref.read(addCarProvider.notifier).state.fuel,
                  onChanged: (value) {
                    isEditted
                        ? ref.read(detailPageSelectedCarProvider).fuel =
                            "Benzin"
                        : ref.read(addCarProvider.notifier).state.fuel =
                            "Benzin";
                    setState(() {});
                  },
                ),
                Text(
                  "Benzin",
                  style: TextStyleHelper.addCarInputName,
                )
              ],
            ),
            Column(
              children: [
                Radio.adaptive(
                  activeColor: ColorUiHelper.appSecondColor,
                  value: "Dizel",
                  groupValue: isEditted
                      ? ref.read(detailPageSelectedCarProvider).fuel
                      : ref.read(addCarProvider.notifier).state.fuel,
                  onChanged: (value) {
                    isEditted
                        ? ref.read(detailPageSelectedCarProvider).fuel = "Dizel"
                        : ref.read(addCarProvider.notifier).state.fuel =
                            "Dizel";
                    setState(() {});
                  },
                ),
                Text(
                  "Dizel",
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
