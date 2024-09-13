import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/models/calc_consump.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/commonwidgets/bottom_sheet.dart';
import 'package:yakit_asistan/views/commonwidgets/calc_button.dart';

class ConsumpPageCalculateButton extends ConsumerWidget {
  const ConsumpPageCalculateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CalcConsump cons = ref.read(calcConsumpProvider);
    bool isLiter = ref.watch(isLiterProvider);
    return CalcPagesCalculateButton(
      onPressed: () {
        double result = 0.0;
        if (isLiter) {
          result = cons.getConsump();
        } else {
          result = cons.getConsumpWithCost();
        }
        ref.read(isLabelActiveProvider.notifier).state = false;
        showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheetContainer(
            content: (result).toStringAsFixed(2),
            title: "Ortalama Tüketiminiz",
            subtitle: "L/100",
          ),
        );
      },
    );
  }
}
