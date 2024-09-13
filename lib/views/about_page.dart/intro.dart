// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_set.dart';

class AboutIntroView extends ConsumerWidget {
  AboutIntroView({super.key, required this.controller});
  PageController controller;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentPage = ref.watch(aboutPageCurrenView);
    return SizedBox(
      width: screen.width,
      height: screen.height * 0.75,
      child: PageView.builder(
        itemCount: TextSet.introTexts.length,
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (value) {
          debugPrint(value.toString());
          ref.read(aboutPageCurrenView.notifier).state = value;
        },
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screen.width > 400 ? 300 : screen.width * 0.75,
              height: screen.width > 700 ? 600 : screen.height * 0.75,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                image: DecorationImage(
                    image: AssetImage("assets/about/${currentPage + 1}.gif"),
                    fit: BoxFit.fill),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
