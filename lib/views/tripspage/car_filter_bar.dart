//*** Veritabanı araç listesine erişme

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_state.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/tripspage/filter_card.dart';

class TripsPageFilterCarBar extends ConsumerWidget {
  TripsPageFilterCarBar({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String selectedCar = ref.watch(tripsPageSelectedCarProvider);
    return BlocBuilder<FuelAssistantBloc, FuelAssistantState>(
      builder: (context, state) => Stack(
        children: [
          state.cars.isEmpty
              ? Container()
              : SizedBox(
                  width: screen.width,
                  height: 120,
                  child: ListView.separated(
                    padding:
                        const EdgeInsets.only(top: 35, bottom: 10, left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.cars.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        String thisCar = state.cars[index].name;
                        if (selectedCar == thisCar) {
                          ref
                              .read(tripsPageSelectedCarProvider.notifier)
                              .state = "Tümü";
                        } else {
                          ref
                              .read(tripsPageSelectedCarProvider.notifier)
                              .state = thisCar;
                        }
                      },
                      child: TripsFilterCarCard(
                          carImgUrl: state.cars[index].imageUrl,
                          isSelectedCard: selectedCar == state.cars[index].name
                              ? true
                              : false),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20),
                  ),
                ),
          Container(
            constraints: BoxConstraints(maxWidth: screen.width / 4 * 3),
            color: ColorUiHelper.appBgColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.filter_alt_rounded,
                  color: ColorUiHelper.appMainColor,
                  size: 28,
                ),
                Text(
                  "Gösterilen: ",
                  style: TextStyleHelper.tripsFilterTitleStyle,
                ),
                Text(
                  state.cars.isEmpty ? "Kayıtsız Araçlar!" : "$selectedCar ",
                  style: TextStyleHelper.tripsSelectedCarNameStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
