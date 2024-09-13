import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class BottomBarStyleHelper extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 18;

  @override
  TextStyle textStyle(Color color, String? fontFamily) =>
      TextStyleHelper.bottomNavigationBarStyle;
}
