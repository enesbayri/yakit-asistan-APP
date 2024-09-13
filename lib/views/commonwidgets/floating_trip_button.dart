import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_state.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/alert_dialog_empty.dart';

class FloatingActionButtonTripsPage extends ConsumerWidget {
  const FloatingActionButtonTripsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<FuelAssistantBloc, FuelAssistantState>(
      builder: (context, state) => FloatingActionButton(
        onPressed: () {
          if (state.cars.isEmpty) {
            AlertDialogForEmptyDataControll.showDeleteAlertDialog(
              context: context,
              title: "Kayıtlı araç yok önce araç ekleyin!",
              onAccessPressed: () {
                ref.read(navigationBarProvider.notifier).state = 3;
                ref.read(addCarProvider.notifier).state.imageUrl =
                    "assets/icons/addCarIcon.png";
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("AddCarPage");
              },
              onBackPressed: () {
                Navigator.of(context).pop();
              },
            );
          } else {
            Navigator.of(context)
                .pushNamed("AddTripPage", arguments: state.cars);
          }
        },
        backgroundColor: ColorUiHelper.appMainColor,
        splashColor: ColorUiHelper.appSecondColor,
        tooltip: "Seyahat Ekle",
        heroTag: "add",
        shape: StadiumBorder(side: BorderSide(color: ColorUiHelper.appBgColor)),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/icons/tripRoad.png",
                color: ColorUiHelper.appBgColor),
          ),
          Positioned(
              right: 13,
              top: -2,
              child: Icon(
                Icons.add_outlined,
                color: ColorUiHelper.appBgColor,
                size: 22,
              ))
        ]),
      ),
    );
  }
}
