import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class FuelCardHeader extends StatelessWidget {
  const FuelCardHeader({
    super.key,
    required this.title,
    required this.borderColor,
  });

  final String title;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 150,
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(width: 5, color: borderColor),
            right: BorderSide(width: 5, color: borderColor),
            top: BorderSide(width: 5, color: borderColor)),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyleHelper.cardHeaderStyle,
      )),
    );
  }
}
