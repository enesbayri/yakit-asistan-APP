import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/page_name_bar.dart';
import 'package:yakit_asistan/views/fueldetailpage/webview_box.dart';

class FeulDetailPage extends StatelessWidget {
  FeulDetailPage({super.key, required this.company, required this.mainColor});
  final screen = locator<ScreenSizeHelper>();
  final String company;
  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screen.width,
          height: screen.height,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: WebViewBox(company: company)),
              Positioned(
                left: 0,
                top: 5,
                child: PageNameBar(
                  pageName: company,
                  color: mainColor,
                  width: screen.width * 0.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
