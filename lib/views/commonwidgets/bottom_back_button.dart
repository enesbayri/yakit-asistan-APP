import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/back_button.dart';

class BottomCarBackButton extends ConsumerWidget {
  const BottomCarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        GoBackPageButton(
          icon: Icon(Icons.arrow_back_ios,
              color: ColorUiHelper.appMainColor, size: 36),
          onPressed: () {
            TextControllerHelper.resetCarName();
            ref.read(isEditCarProvider.notifier).state = false;
          },
        )
      ],
    );
  }
}
