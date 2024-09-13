import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/appbar.dart';

class PageScaffoldBuilder extends StatelessWidget {
  const PageScaffoldBuilder({
    super.key,
    required this.content,
    this.bottomNavigation,
    this.appbar,
    this.floatingActionButton,
  });

  final Widget content;
  final Widget? bottomNavigation;
  final PreferredSizeWidget? appbar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorUiHelper.appMainColor,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigation,
      appBar: (appbar == null
          ? Appbar.getAppBar(context)
          : Appbar.getCalcPagesAppBar),
      body: content,
    );
  }
}
