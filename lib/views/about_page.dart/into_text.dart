import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_set.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class IntroTextView extends ConsumerWidget {
  IntroTextView({super.key});
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentPage = ref.watch(aboutPageCurrenView);
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              10,
              (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentPage == index ? 30 : 10,
                    height: 10,
                    margin: const EdgeInsets.only(left: 4),
                    padding: const EdgeInsets.only(
                        left: 6, right: 6, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      //border: Border.all(color: currentPage == index ? ColorUiHelper.appBgColor : ColorUiHelper.appSecondColor ,width: 1),
                      color: currentPage == index
                          ? ColorUiHelper.appMainColor
                          : ColorUiHelper.appSecondColor,
                    ),
                  )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              10,
              (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: currentPage == index ? screen.width * 0.6 : 10,
                    height: currentPage == index ? screen.width * 0.28 : 10,
                    margin: EdgeInsets.only(
                        left: 4, top: currentPage == index ? 20 : 0),
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                          color: currentPage == index
                              ? ColorUiHelper.appBgColor
                              : ColorUiHelper.appTransparentColor,
                          width: 1),
                      color: currentPage == index
                          ? ColorUiHelper.appMainColor
                          : ColorUiHelper.appTransparentColor,
                    ),
                    child: currentPage == index
                        ? Center(
                            child: FutureBuilder(
                                future: Future.delayed(
                                    const Duration(milliseconds: 300), () => 1),
                                key: UniqueKey(),
                                builder: (context, snapshot) => snapshot.hasData
                                    ? Text(
                                        TextSet.introTexts[currentPage],
                                        style:
                                            TextStyleHelper.aboutPageIntrostyle,
                                      )
                                    : Container(
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/icons/loading-gif.gif"))),
                                      )))
                        : Container(),
                  )),
        ),
      ],
    );
  }
}
