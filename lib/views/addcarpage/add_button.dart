//*** Veritabanına araç ekleme - Veritabanı araç güncelleme -veritabanı seyahat listesine erişme ve seyahat ismi güncelleme
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_event.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_state.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/error_snackbar.dart';

class AddCarButton extends ConsumerWidget {
  const AddCarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isEditted = ref.read(isEditCarProvider);
    return BlocBuilder<FuelAssistantBloc, FuelAssistantState>(
      builder: (context, state) {
        return TextButton.icon(
            style: ButtonStyle(
              side: MaterialStatePropertyAll(
                  BorderSide(color: ColorUiHelper.appSecondColor, width: 1)),
              overlayColor:
                  MaterialStatePropertyAll(ColorUiHelper.appSecondColor),
              backgroundColor:
                  MaterialStatePropertyAll(ColorUiHelper.appMainColor),
            ),
            onPressed: () {
              bool carEmptyNameValidate =
                  TextControllerHelper.carNameValidator();
              if (carEmptyNameValidate) {
                String carName = TextControllerHelper.addCarNameController.text;
                bool alreadyCarNameValidate =
                    Car.alreadyNameValidator(carName, state.cars);
                if (isEditted && !alreadyCarNameValidate) {
                  alreadyCarNameValidate =
                      (carName == ref.read(detailPageSelectedCarProvider).name);
                }
                if (alreadyCarNameValidate) {
                  ref.read(addCarProvider.notifier).state.name = carName;
                  TextControllerHelper.resetCarName();
                  if (isEditted) {
                    Car lastCar =
                        (ref.read(detailPageSelectedCarProvider)).copyWith();
                    Car newCar = (ref.read(addCarProvider)).copyWith();
                    Car edittedCar =
                        Car.editCar(lastCar.copyWith(), newCar.copyWith());

                    context.read<FuelAssistantBloc>().add(EditCarEvent(
                        lastCar: lastCar,
                        newCar: edittedCar)); //araç güncellenir
                    context
                        .read<FuelAssistantBloc>()
                        .add(RefreshDatabaseEvent());
                    ref.read(isEditCarProvider.notifier).state = false;
                    Navigator.of(context).pushReplacementNamed("HomePage");
                  } else {
                    Car car = (ref.read(addCarProvider)).copyWith();
                    context
                        .read<FuelAssistantBloc>()
                        .add(AddCarEvent(car: car)); //araç eklenir
                    context
                        .read<FuelAssistantBloc>()
                        .add(RefreshDatabaseEvent());
                    Navigator.of(context).pushReplacementNamed("HomePage");
                  }
                } else {
                  ErrorSnackBar.showErrorSnackBar(context,
                      title: "Araç Adı Zaten Kullanımda!");
                }
              } else {
                ErrorSnackBar.showErrorSnackBar(context,
                    title: "Araç Adı Boş Olamaz!");
              }
            },
            icon: Icon(
              Icons.add_box,
              color: ColorUiHelper.appBgColor,
            ),
            label: Text(
              isEditted ? "Güncelle" : "Aracı Ekle",
              style: TextStyleHelper.addButtonStyle,
            ));
      },
    );
  }
}
