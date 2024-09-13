import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/models/fuel_to_dist.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/commonwidgets/bottom_sheet.dart';
import 'package:yakit_asistan/views/commonwidgets/calc_button.dart';

class FuelToDistCalculateButton extends ConsumerWidget {
  const FuelToDistCalculateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FuelToDist calc = ref.read(fuelToDistProvider);
    return CalcPagesCalculateButton(
      onPressed: () {
        double result;

        result = calc.getDist();

        ref.read(isLabelActiveProvider.notifier).state = false;
        showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheetContainer(
            content: (result).toStringAsFixed(2),
            title: "Gidebileceğiniz Mesafe",
            subtitle: "KM",
          ),
        );
      },
    );
  }
}
