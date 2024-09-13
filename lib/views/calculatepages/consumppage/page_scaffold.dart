import 'package:flutter/cupertino.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/calculatepages/consumppage/page_content.dart';
import 'package:yakit_asistan/views/commonwidgets/appbar.dart';
import 'package:yakit_asistan/views/commonwidgets/bottom_navigation.dart';
import 'package:yakit_asistan/views/commonwidgets/page_scaffold_builder.dart';

class ConsumpPageScaffold extends StatelessWidget {
  const ConsumpPageScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBuilder(
      appbar: Appbar.getCalcPagesAppBar,
      content: Container(
          color: ColorUiHelper.appBgColor, child: const ConsumpPageContent()),
      bottomNavigation: const BottomNavigation(isCalcPage: true),
    );
  }
}
