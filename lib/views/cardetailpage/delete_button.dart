//*** veritabanı araçlara erişme
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_event.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/alert_dialog_delete.dart';

class CarDetailDeleteButton extends ConsumerWidget {
  const CarDetailDeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
          color: ColorUiHelper.appBgColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: ColorUiHelper.appMainColor.withOpacity(1),
                spreadRadius: 0.1,
                blurRadius: 5,
                offset: const Offset(0, 3)),
          ],
        ),
        child: IconButton(
          highlightColor: ColorUiHelper.appSecondColor,
          onPressed: () {
            AlertDialogForDelete.showDeleteAlertDialog(
              context: context,
              title: "Araç silinsin mi?",
              onDeletePressed: () {
                Car currentCar = ref.read(detailPageSelectedCarProvider);
                context
                    .read<FuelAssistantBloc>()
                    .add(DeleteCarEvent(currentCar: currentCar));
                context.read<FuelAssistantBloc>().add(RefreshDatabaseEvent());
                ref.read(isEditCarProvider.notifier).state = false;
                //Navigator.of(context).pushReplacementNamed("MyCarsPage");
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              onBackPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
          icon: Icon(
            Icons.delete_forever,
            color: ColorUiHelper.carsSortColor,
            size: 24,
          ),
        ));
  }
}
