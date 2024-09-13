import 'package:flutter/material.dart';
import 'package:segment_display/segment_display.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class FuelCardContent extends StatelessWidget {
  FuelCardContent({
    super.key,
    required this.type,
    required this.cost,
  });

  final String type;
  final String cost;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 8,
        ),
        SizedBox(
            width: (screen.width - 50) / 3,
            child: Center(
                child: Text(
              type,
              overflow: TextOverflow.ellipsis,
              style: TextStyleHelper.cardContentTypeStyle,
            ))),
        Container(
          width: (screen.width - 50) / 3,
          height: 3,
          color: Colors.black,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            color: ColorUiHelper.costBackgroundColor,
          ),
          padding: const EdgeInsets.all(2),
          child: Center(
              child: SevenSegmentDisplay(
            backgroundColor: ColorUiHelper.costBackgroundColor,
            value: cost,
            segmentStyle: DefaultSegmentStyle(
                segmentBaseSize: const Size(0.5, 0.3),
                segmentSpacing: 1.5,
                enabledColor: ColorUiHelper.segmentEnabledColor,
                disabledColor: ColorUiHelper.costSegmentDisabledColor),
          )),
        ),
      ],
    );
  }
}
