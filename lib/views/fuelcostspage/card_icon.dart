import 'package:flutter/material.dart';

class FuelCardIcon extends StatelessWidget {
  const FuelCardIcon({
    super.key,
    required this.url,
    required this.imgBgColor,
  });

  final String url;
  final Color imgBgColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: imgBgColor,
      child: Image.asset(url),
    );
  }
}
