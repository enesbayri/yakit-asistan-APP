//*** Veritabanı araç listesine eriş
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_state.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/carspage/car_card.dart';
import 'package:yakit_asistan/views/carspage/search_sort_bar.dart';
import 'package:yakit_asistan/views/commonwidgets/empty_data_info.dart';
import 'package:yakit_asistan/views/commonwidgets/loading_widget.dart';

class MyCarsPageContent extends ConsumerWidget {
  MyCarsPageContent({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String carNameInput = ref.watch(myCarsPageNameInputProvider);
    ref.watch(myCarsPageSortProvider);
    return BlocBuilder<FuelAssistantBloc, FuelAssistantState>(
        builder: (context, state) {
      if (state is LoadingDataState) {
        return LoadingWidget();
      } else {
        return SizedBox(
          width: screen.width,
          height: screen.height,
          child: state.cars.isEmpty
              ? EmptyDataInfo(title: "Kayıtlı Araç Yok!")
              : ListView.builder(
                  itemCount: state.cars.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return MyCarsSearchAndSortBar();
                    } else {
                      Car car = state.cars[index - 1];
                      if (carNameInput == "") {
                        return InkWell(
                            onTap: () {
                              ref
                                  .read(detailPageSelectedCarProvider.notifier)
                                  .state = car;
                              Navigator.of(context).pushNamed("CarDetailPage");
                            },
                            child: MyCarCard(
                                carName: car.name,
                                fuelType: car.fuel,
                                transmission: car.transmission,
                                modelYear: car.model,
                                avgCons: car.consump,
                                carImg: car.imageUrl));
                      } else {
                        if (car.name
                            .toUpperCase()
                            .contains(carNameInput.toUpperCase())) {
                          return InkWell(
                              onTap: () {
                                ref
                                    .read(
                                        detailPageSelectedCarProvider.notifier)
                                    .state = car;
                                Navigator.of(context)
                                    .pushNamed("CarDetailPage");
                              },
                              child: MyCarCard(
                                  carName: car.name,
                                  fuelType: car.fuel,
                                  transmission: car.transmission,
                                  modelYear: car.model,
                                  avgCons: car.consump,
                                  carImg: car.imageUrl));
                        } else {
                          return Container();
                        }
                      }
                    }
                  },
                ),
        );
      }
    });
  }
}
