import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/models/dist_to_cost.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/commonwidgets/scroll_input.dart';
import 'package:yakit_asistan/views/commonwidgets/select_scroll.dart';

class DistToCostPageTopScrollWidget extends ConsumerWidget {
  const DistToCostPageTopScrollWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DistToCost calc = ref.read(distToCostProvider);
    return CalculatePagesScrollInputCard(
      child: SelectScrollRowWithLabel(
        title: "Kaç kilometre yol gideceksiniz?",
        subtitle: "KM",
        children: List.generate(5000, (i) => i + 1),
        selectedIndex: calc.dist,
        onChanged: (index) {
          calc.dist = index;
        },
      ),
    );
  }
}
