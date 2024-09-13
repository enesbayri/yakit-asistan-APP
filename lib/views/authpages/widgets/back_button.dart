import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class BackFromLoginAndRegisterPage extends StatelessWidget {
  const BackFromLoginAndRegisterPage({
    super.key,
    required this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IconButton(
        highlightColor: ColorUiHelper.appSecondColor,
        onPressed: onPressed,
        icon: Icon(Icons.close, color: ColorUiHelper.appMainColor, size: 36),
      ),
    );
  }
}
