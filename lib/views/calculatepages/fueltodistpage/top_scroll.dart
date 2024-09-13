import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/models/fuel_to_dist.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/commonwidgets/scroll_input.dart';
import 'package:yakit_asistan/views/commonwidgets/select_scroll.dart';

class FuelToDistPageTopScrollWidget extends ConsumerWidget {
  const FuelToDistPageTopScrollWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FuelToDist calc = ref.read(fuelToDistProvider);
    return CalculatePagesScrollInputCard(
      child: SelectScrollRowWithLabel(
        title: "Kaç litre yakıtınız var?",
        subtitle: "L",
        children: List.generate(1000, (i) => i + 1),
        selectedIndex: calc.fuel,
        onChanged: (index) {
          calc.fuel = index;
        },
      ),
    );
  }
}
