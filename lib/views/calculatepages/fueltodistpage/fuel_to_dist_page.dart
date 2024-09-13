
import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/calculatepages/fueltodistpage/page_content.dart';
import 'package:yakit_asistan/views/commonwidgets/appbar.dart';
import 'package:yakit_asistan/views/commonwidgets/bottom_navigation.dart';
import 'package:yakit_asistan/views/commonwidgets/page_scaffold_builder.dart';

class FuelToDistPage extends StatelessWidget {
  const FuelToDistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBuilder(
      appbar: Appbar.getCalcPagesAppBar,
      content: Container(
          color: ColorUiHelper.appBgColor,
          child: const FuelToDistPageContent()),
      bottomNavigation: const BottomNavigation(isCalcPage: true),
    );
  }
}
