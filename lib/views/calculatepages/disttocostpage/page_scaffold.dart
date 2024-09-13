import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/calculatepages/disttocostpage/page_content.dart';
import 'package:yakit_asistan/views/commonwidgets/appbar.dart';
import 'package:yakit_asistan/views/commonwidgets/bottom_navigation.dart';
import 'package:yakit_asistan/views/commonwidgets/page_scaffold_builder.dart';

class DistToCostPageScaffold extends StatelessWidget {
  const DistToCostPageScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBuilder(
      appbar: Appbar.getCalcPagesAppBar,
      content: Container(
          color: ColorUiHelper.appBgColor,
          child: const DistToCostPageContent()),
      bottomNavigation: const BottomNavigation(isCalcPage: true),
    );
  }
}
