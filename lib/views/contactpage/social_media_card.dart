import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/router/url_router.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class ContactUsSocialMediaCard extends StatelessWidget {
  ContactUsSocialMediaCard({
    super.key,
    required this.title,
    required this.leading,
    required this.cardColor,
  });

  final String title;
  final Widget leading;
  final Color cardColor;

  final urllaunch = locator<UrlLauncher>();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        overlayColor: MaterialStatePropertyAll(ColorUiHelper.appSecondColor),
        splashColor: ColorUiHelper.appSecondColor,
        borderRadius: BorderRadius.circular(24),
        onTap: () async {
          await urllaunch.launch(title);
        },
        child: Container(
          width: 200,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              border: Border.all(color: cardColor, width: 4),
              borderRadius: BorderRadius.circular(24),
              color: ColorUiHelper.appBgColor,
              boxShadow: [
                BoxShadow(
                  color: cardColor,
                  blurRadius: 0.3,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                )
              ]),
          padding: const EdgeInsets.only(left: 16, bottom: 4, top: 4),
          child: Row(
            children: [
              leading,
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyleHelper.contactUsStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
