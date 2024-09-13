import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';

class CarDetailEditButton extends ConsumerWidget {
  const CarDetailEditButton({
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
            ref.read(isEditCarProvider.notifier).state = true;
            TextControllerHelper.addCarNameController.text =
                ref.read(detailPageSelectedCarProvider).name;
            Navigator.of(context).pushNamed("AddCarPage");
          },
          icon: Icon(
            Icons.edit,
            color: ColorUiHelper.appMainColor,
            size: 24,
          ),
        ));
  }
}
