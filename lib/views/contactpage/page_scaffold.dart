import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/back_button.dart';
import 'package:yakit_asistan/views/contactpage/social_media_card.dart';

class ContactUsPageScaffold extends StatelessWidget {
  ContactUsPageScaffold({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: screen.width,
        height: screen.height,
        child: Stack(
          children: [
            Container(
              width: screen.width,
              height: screen.height / 5 * 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/ebaysoft.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screen.width,
                height: screen.height / 10 * 5,
                decoration: BoxDecoration(
                  color: ColorUiHelper.appBgColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                        color: ColorUiHelper.appMainColor.withOpacity(1),
                        spreadRadius: 0.1,
                        blurRadius: 5,
                        offset: const Offset(0, -3)),
                  ],
                ),
                child: Column(children: [
                  Container(
                    width: 100,
                    height: 5,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: ColorUiHelper.appMainColor,
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bize Ulaşın!",
                    style: TextStyleHelper.contactUsTitleStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContactUsSocialMediaCard(
                          title: "Gmail",
                          leading: Icon(
                            Icons.mail,
                            color: ColorUiHelper.mailIconColor,
                            size: 30,
                          ),
                          cardColor: ColorUiHelper.mailIconColor,
                        ),
                        ContactUsSocialMediaCard(
                          title: "LinkedIn",
                          leading: FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: ColorUiHelper.linkedinIconColor,
                            size: 30,
                          ),
                          cardColor: ColorUiHelper.linkedinIconColor,
                        ),
                        ContactUsSocialMediaCard(
                          title: "Github",
                          leading: FaIcon(
                            FontAwesomeIcons.github,
                            color: ColorUiHelper.githubIconColor,
                            size: 30,
                          ),
                          cardColor: ColorUiHelper.githubIconColor,
                        ),
                        ContactUsSocialMediaCard(
                          title: "İnstagram",
                          leading: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: ColorUiHelper.instagramIconColor,
                            size: 30,
                          ),
                          cardColor: ColorUiHelper.instagramIconColor,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
            const Positioned(
              top: 25,
              child: GoBackPageButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 36,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
