import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class AboutPageFloatingActionButtonBar extends ConsumerWidget {
  const AboutPageFloatingActionButtonBar({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentPage = ref.watch(aboutPageCurrenView);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            currentPage != 9
                ? Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: FloatingActionButton.small(
                      backgroundColor: ColorUiHelper.appBgColor,
                      shape: const CircleBorder(),
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      child: const Icon(Icons.swipe_left),
                    ),
                  )
                : Container(),
            currentPage != 0
                ? FloatingActionButton.small(
                    backgroundColor: ColorUiHelper.appBgColor,
                    shape: const CircleBorder(),
                    onPressed: () {
                      controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: const Icon(Icons.swipe_right),
                  )
                : Container(),
          ],
        )
      ],
    );
  }
}
