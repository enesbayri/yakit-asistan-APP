import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/models/dist_to_cost.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/commonwidgets/bottom_sheet.dart';
import 'package:yakit_asistan/views/commonwidgets/calc_button.dart';

class DistToCostCalculateButton extends ConsumerWidget {
  const DistToCostCalculateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DistToCost calc = ref.read(distToCostProvider);
    return CalcPagesCalculateButton(
      onPressed: () {
        var result = calc.getCost();
        ref.read(isLabelActiveProvider.notifier).state = false;
        showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheetContainer(
            content: (result).toStringAsFixed(2),
            title: "Yol Masrafı",
            subtitle: "TL",
          ),
        );
      },
    );
  }
}
