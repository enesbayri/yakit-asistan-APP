import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class AddCarModelYearDropDown extends ConsumerWidget {
  AddCarModelYearDropDown({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isEditted = ref.read(isEditCarProvider);
    return SizedBox(
      width: screen.width / 2,
      child: CustomDropdown<int>.search(
        decoration: CustomDropdownDecoration(
          listItemDecoration: ListItemDecoration(
              splashColor: ColorUiHelper.appMainColor.withOpacity(0.5),
              selectedColor: ColorUiHelper.appSecondColor),
          closedBorder: Border.all(color: ColorUiHelper.appMainColor, width: 2),
          closedBorderRadius: BorderRadius.circular(32),
          closedShadow: [
            BoxShadow(
                color: ColorUiHelper.appMainColor.withOpacity(1),
                spreadRadius: 0.1,
                blurRadius: 5,
                offset: const Offset(0, 3)),
          ],
          expandedBorder:
              Border.all(color: ColorUiHelper.appMainColor, width: 2),
          expandedBorderRadius: BorderRadius.circular(32),
          expandedShadow: [
            BoxShadow(
                color: ColorUiHelper.appMainColor.withOpacity(1),
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
        initialItem:
            isEditted ? ref.read(detailPageSelectedCarProvider).model : 2024,
        hintText: 'Model Yılı Seçin',
        items: Car.carModelYears,
        excludeSelected: false,
        onChanged: (value) {
          isEditted
              ? ref.read(detailPageSelectedCarProvider).model = value
              : ref.read(addCarProvider.notifier).state.model = value;
        },
      ),
    );
  }
}
