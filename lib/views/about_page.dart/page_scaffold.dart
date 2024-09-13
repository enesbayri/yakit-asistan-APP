import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/about_page.dart/floating_button_bar.dart';
import 'package:yakit_asistan/views/about_page.dart/into_text.dart';
import 'package:yakit_asistan/views/about_page.dart/intro.dart';
import 'package:yakit_asistan/views/commonwidgets/back_button.dart';

class AboutPageScaffold extends ConsumerStatefulWidget {
  const AboutPageScaffold({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AboutPageScaffoldState();
}

class _AboutPageScaffoldState extends ConsumerState<AboutPageScaffold> {
  final screen = locator<ScreenSizeHelper>();

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screen.width,
        height: screen.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginbg/2.png"), fit: BoxFit.fill)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: IntroTextView()),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: AboutIntroView(controller: controller)),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 20),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: ColorUiHelper.appBgColor),
              child: GoBackPageButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: ColorUiHelper.appMainColor,
                ),
                onPressed: () {
                  ref.read(aboutPageCurrenView.notifier).state = 0;
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton:
          AboutPageFloatingActionButtonBar(controller: controller),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
