import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class SyncDBNameCard extends StatelessWidget {
  const SyncDBNameCard({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 40,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: ColorUiHelper.appBgColor,
          border: Border.all(color: ColorUiHelper.syncPageMainColor, width: 2),
          borderRadius: BorderRadius.circular(16)),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyleHelper.syncDBNameStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
