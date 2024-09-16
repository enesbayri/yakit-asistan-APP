import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_state.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/trip.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/empty_data_info.dart';
import 'package:yakit_asistan/views/commonwidgets/error_snackbar.dart';
import 'package:yakit_asistan/views/commonwidgets/loading_widget.dart';
import 'package:yakit_asistan/views/tripspage/car_filter_bar.dart';
import 'package:yakit_asistan/views/tripspage/trip_card.dart';

class MyTripsPageContent extends ConsumerWidget {
  MyTripsPageContent({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String selectedCar = ref.watch(tripsPageSelectedCarProvider);
    ref.watch(deletedTripsProvider);
    return BlocBuilder<FuelAssistantBloc, FuelAssistantState>(
        builder: (context, state) {
      if (state is LoadingDataState) {
        return LoadingWidget();
      } else {
        if (state is ErrorDataState) {
          ErrorSnackBar.showErrorSnackBar(context, title: "Bir hata oluştu!");
          return LoadingWidget();
        }else {
        return state.trips.isEmpty
            ? EmptyDataInfo(title: "Seyahat Yok!")
            : ListView.builder(
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: screen.width,
                          height: 60,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.route_outlined,
                                  color: ColorUiHelper.appMainColor,
                                  size: 32,
                                ),
                              ),
                              Text(
                                "Seyahatlerim",
                                style: TextStyleHelper.cardHeaderStyle,
                              )
                            ],
                          ),
                        ),
                        TripsPageFilterCarBar(),
                      ],
                    );
                  } else {
                    Trip trip = state.trips[index - 1];
                    if (selectedCar == "Tümü") {
                      return TripCard(
                          tripId: index - 1,
                          carName: trip.carName,
                          consump: trip.carConsump!,
                          dist: trip.dist,
                          from: trip.from,
                          to: trip.to,
                          spendFuel: trip.spendFuel,
                          trip: trip);
                    } else if (trip.carName == selectedCar) {
                      return TripCard(
                        tripId: index - 1,
                        carName: trip.carName,
                        consump: trip.carConsump!,
                        dist: trip.dist,
                        from: trip.from,
                        to: trip.to,
                        spendFuel: trip.spendFuel,
                        trip: trip,
                      );
                    } else {
                      return Container();
                    }
                  }
                },
                itemCount: state.trips.length +
                    1, // 0 ıncı indexte araçlar barı bulunacağı için 1 index fazla alınacak
              );
      }
    }
    });
  }
}
