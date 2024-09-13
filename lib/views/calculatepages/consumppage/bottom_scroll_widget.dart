import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/models/calc_consump.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/commonwidgets/scroll_input.dart';
import 'package:yakit_asistan/views/commonwidgets/select_scroll.dart';

class ConsumpPageBottomScrollWidget extends ConsumerWidget {
  const ConsumpPageBottomScrollWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CalcConsump cons = ref.read(calcConsumpProvider);
    return CalculatePagesScrollInputCard(
      child: SelectScrollRowWithLabel(
        title: "Kaç kilometre yol gittiniz?",
        subtitle: "KM",
        children: List.generate(5000, (i) => i + 1),
        selectedIndex: cons.dist,
        onChanged: (index) {
          cons.dist = index;
        },
      ),
    );
  }
}
