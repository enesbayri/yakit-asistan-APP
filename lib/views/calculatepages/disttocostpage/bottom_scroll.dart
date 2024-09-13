import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/models/dist_to_cost.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/commonwidgets/scroll_input.dart';
import 'package:yakit_asistan/views/commonwidgets/select_scroll.dart';

class DistToCostBottomScrollWidget extends ConsumerWidget {
  const DistToCostBottomScrollWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DistToCost calc = ref.read(distToCostProvider);
    return CalculatePagesScrollInputCard(
      child: SelectScrollRowWithLabel(
        title: "Aracınızın ortalama yakıt tüketimi?",
        subtitle: "L/100",
        children: List.generate(1000, (i) => i + 1),
        selectedIndex: calc.consump,
        onChanged: (index) {
          calc.consump = index;
        },
      ),
    );
  }
}
