import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_event.dart';
import 'package:yakit_asistan/models/trip.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/error_snackbar.dart';

class AddTripButton extends ConsumerWidget {
  const AddTripButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: ColorUiHelper.appMainColor,
        borderRadius: BorderRadius.circular(32),
        border:
            Border.all(width: 1, color: ColorUiHelper.calcutesBoxBorderColor),
        boxShadow: [
          BoxShadow(
              color: ColorUiHelper.appSecondColor.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3)),
        ],
      ),
      width: 120,
      height: 40,
      child: TextButton.icon(
          style: ButtonStyle(
            side: MaterialStatePropertyAll(
                BorderSide(color: ColorUiHelper.appMainColor, width: 1)),
            overlayColor:
                MaterialStatePropertyAll(ColorUiHelper.appSecondColor),
          ),
          onPressed: () {
            Trip selectedCarTrip = (ref.read(addTripProvider))
                .copyWith(); // Trip eklenecek Seçili araç
            Trip? trip = Trip.addTripContentFromTextController(selectedCarTrip);
            if (trip == null) {
              ErrorSnackBar.showErrorSnackBar(context,
                  title:
                      "Lütfen Bilgileri Eksiksiz Doldurun!"); // Boş input uyarısı
            } else {
              context.read<FuelAssistantBloc>().add(AddTripToCarEvent(
                  trip: trip)); // araca ortalama ve total mesafeyi ekleme
              context
                  .read<FuelAssistantBloc>()
                  .add(AddTripEvent(trip: trip)); // Veritabanına ekleme
              context.read<FuelAssistantBloc>().add(RefreshDatabaseEvent());
              ref.read(addTripProvider.notifier).state.carName =
                  ""; // Son kayıtlı araç ismini resetleme
              Navigator.of(context).pushReplacementNamed("HomePage");
            }
          },
          icon: Icon(
            Icons.add,
            color: ColorUiHelper.appBgColor,
          ),
          label: Text(
            "Ekle",
            style: TextStyleHelper.addTripButtonStyle,
          )),
    );
  }
}
