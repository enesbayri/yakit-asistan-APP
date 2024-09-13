//*** veritabanı araç listesine eriş düzenle
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_state.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/sort_bar.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class CarsSortBar extends ConsumerWidget {
  const CarsSortBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(myCarsPageSortProvider);
    return BlocBuilder<FuelAssistantBloc, FuelAssistantState>(
      builder: (context, state) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.sort,
            color: ColorUiHelper.appMainColor,
            size: 40,
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {
              ref.read(myCarsPageSortProvider.notifier).state += 1;
              if (SortBar.sortModelYear == 2) {
                SortBar.iconModelYear = Icons.unfold_more_sharp;
                SortBar.sortModelYear = 0;
              } else {
                if (SortBar.sortModelYear == 1) {
                  SortBar.iconModelYear = Icons.arrow_drop_up_sharp;
                  state.cars.sort((a, b) => a.model.compareTo(b.model));
                } else {
                  SortBar.iconModelYear = Icons.arrow_drop_down_sharp;
                  state.cars.sort((a, b) => b.model.compareTo(a.model));
                }
                SortBar.sortModelYear += 1;
                SortBar.iconFuelConsump = Icons.unfold_more_sharp;
                SortBar.sortFuelConsump = 0;
              }
              debugPrint("${SortBar.sortModelYear}tık son");
            },
            child: Container(
              height: 30,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                border: Border.all(color: ColorUiHelper.appMainColor, width: 2),
                borderRadius: BorderRadius.circular(16),
                color: SortBar.sortModelYear == 0
                    ? ColorUiHelper.appBgColor
                    : ColorUiHelper.appMainColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 2.0, right: 6, top: 2, bottom: 2),
                child: Row(
                  children: [
                    Icon(
                      SortBar.iconModelYear,
                      color: SortBar.sortModelYear == 0
                          ? ColorUiHelper.appSecondColor
                          : ColorUiHelper.carsSortColor,
                    ),
                    Text(
                      "Model Yılı",
                      style: SortBar.sortModelYear == 0
                          ? TextStyleHelper.myCarsSortButtonsStyle
                          : TextStyleHelper.myCarsSortButtonsPressedStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              ref.read(myCarsPageSortProvider.notifier).state += 1;
              if (SortBar.sortFuelConsump == 2) {
                SortBar.iconFuelConsump = Icons.unfold_more_sharp;
                SortBar.sortFuelConsump = 0;
              } else {
                if (SortBar.sortFuelConsump == 1) {
                  SortBar.sortModelYear = 0;
                  SortBar.iconModelYear = Icons.unfold_more_sharp;
                  SortBar.iconFuelConsump = Icons.arrow_drop_up_sharp;
                  state.cars.sort((a, b) => a.consump.compareTo(b.consump));
                } else {
                  SortBar.iconFuelConsump = Icons.arrow_drop_down_sharp;
                  state.cars.sort((a, b) => b.consump.compareTo(a.consump));
                }
                SortBar.sortModelYear = 0;
                SortBar.iconModelYear = Icons.unfold_more_sharp;
                SortBar.sortFuelConsump += 1;
              }
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: ColorUiHelper.appMainColor, width: 2),
                borderRadius: BorderRadius.circular(16),
                color: SortBar.sortFuelConsump == 0
                    ? ColorUiHelper.appBgColor
                    : ColorUiHelper.appMainColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 2.0, right: 6, top: 2, bottom: 2),
                child: Row(
                  children: [
                    Icon(
                      SortBar.iconFuelConsump,
                      color: SortBar.sortFuelConsump == 0
                          ? ColorUiHelper.appSecondColor
                          : ColorUiHelper.carsSortColor,
                    ),
                    Text(
                      "Tüketim",
                      style: SortBar.sortFuelConsump == 0
                          ? TextStyleHelper.myCarsSortButtonsStyle
                          : TextStyleHelper.myCarsSortButtonsPressedStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
