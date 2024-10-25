import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class AddTripCarNameDropDown extends ConsumerWidget {
  AddTripCarNameDropDown({super.key, required this.cars});
  final screen = locator<ScreenSizeHelper>();
  final List<Car> cars;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: screen.width / 5 * 2,
      height: 50,
      child: CustomDropdown<String>(
        closedHeaderPadding:
            const EdgeInsets.only(left: 6, top: 4, right: 4, bottom: 4),
        decoration: CustomDropdownDecoration(
          closedSuffixIcon: const Icon(Icons.car_repair_rounded),
          listItemDecoration: ListItemDecoration(
              splashColor: ColorUiHelper.appMainColor.withOpacity(0.5),
              selectedColor: ColorUiHelper.appSecondColor),
          closedBorder: Border.all(color: ColorUiHelper.appMainColor, width: 2),
          closedBorderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(32),
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32)),
          closedShadow: [
            BoxShadow(
                color: ColorUiHelper.appSecondColor.withOpacity(1),
                spreadRadius: 0.1,
                blurRadius: 3,
                offset: const Offset(0, 2)),
          ],
          expandedBorder:
              Border.all(color: ColorUiHelper.appMainColor, width: 2),
          expandedBorderRadius: BorderRadius.circular(24),
          expandedShadow: [
            BoxShadow(
                color: ColorUiHelper.appSecondColor.withOpacity(1),
                spreadRadius: 0.1,
                blurRadius: 5,
                offset: const Offset(0, 3)),
          ],
          hintStyle: TextStyleHelper.textInputStyle,
          listItemStyle: TextStyleHelper.textInputStyle,
          headerStyle: TextStyleHelper.textInputStyle,
          searchFieldDecoration: SearchFieldDecoration(
              textStyle: TextStyleHelper.textInputStyle,
              hintStyle: TextStyleHelper.textInputStyle),
        ),
        //initialItem: state.cars[0].name,
        hintText: 'Araç Seçiniz',
        items: cars.map((e) => e.name).toList(),
        excludeSelected: false,
        onChanged: (value) {
          ref.read(addTripProvider.notifier).state.carName = value!;
        },
      ),
    );
  }
}
