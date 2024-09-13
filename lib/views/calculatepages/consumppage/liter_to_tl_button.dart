import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class LiterToTLButton extends ConsumerWidget {
  const LiterToTLButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLiter = ref.watch(isLiterProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            ref.read(isLiterProvider.notifier).state = (!isLiter);
          },
          child: Container(
            width: 180,
            height: 40,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: ColorUiHelper.appMainColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.cached_outlined,
                  color: ColorUiHelper.appSecondColor,
                  size: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    (isLiter) ? "TL olarak seç" : "Litre olarak seç",
                    style: TextStyleHelper.calcChangeButtontStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
