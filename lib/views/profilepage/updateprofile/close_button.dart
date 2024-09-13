import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class CloseUpdateCardButton extends StatelessWidget {
  const CloseUpdateCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IconButton(
        highlightColor: ColorUiHelper.appSecondColor,
        onPressed: () {
          AnimationControll.profileController.reverse();
        },
        icon: Icon(Icons.close, color: ColorUiHelper.appMainColor, size: 36),
      ),
    );
  }
}
