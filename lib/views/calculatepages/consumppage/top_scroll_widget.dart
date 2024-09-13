import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/models/calc_consump.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/commonwidgets/scroll_input.dart';
import 'package:yakit_asistan/views/commonwidgets/select_scroll.dart';

class ConsumpPageTopScrollWidget extends ConsumerWidget {
  const ConsumpPageTopScrollWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLiter = ref.watch(isLiterProvider);
    CalcConsump cons = ref.read(calcConsumpProvider);
    return CalculatePagesScrollInputCard(
      child: SelectScrollRowWithLabel(
        title: (isLiter) ? "Kaç litre yakıt aldınız?" : "Kaç TL yakıt aldınız",
        subtitle: (isLiter) ? "L" : "TL",
        children: List.generate(500, (i) => i + 1),
        selectedIndex: cons.fuel,
        onChanged: (index) {
          cons.fuel = index;
        },
      ),
    );
  }
}
