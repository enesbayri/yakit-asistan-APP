import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class AppBarMenuButton extends StatelessWidget {
  const AppBarMenuButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: InkWell(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(32), bottomRight: Radius.circular(32)),
        onTap: onPressed,
        splashColor: ColorUiHelper.appSecondColor,
        child: Image.asset("assets/icons/AppBarIcon3.png"),
      ),
    );
  }
}
