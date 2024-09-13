import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_set.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/back_button.dart';

class PolicyPageContent extends StatelessWidget {
  PolicyPageContent({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.phonelink_lock,
                    color: ColorUiHelper.appSecondColor,
                    size: 36,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.policy,
                    color: ColorUiHelper.appSecondColor,
                    size: 36,
                  ),
                ),
                Icon(
                  Icons.privacy_tip,
                  color: ColorUiHelper.appSecondColor,
                  size: 36,
                ),
              ],
            ),
          ),
          Text(
            "Gizlilik Politikası ve İlkeleri",
            style: TextStyleHelper.policyTitleStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Veri Toplama ve Kullanımı:",
            style: TextStyleHelper.policySubTitleStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.policy[0],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("Veri Saklama ve Güvenliği:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.policy[1],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("Veri Paylaşımı ve Üçüncü Taraf Hizmetleri:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.policy[2],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("Çocukların Gizliliği:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.policy[3],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("Kullanıcı Hakları:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.policy[4],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("Değişiklikler ve Güncellemeler:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.policy[5],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("İletişim Bilgileri:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.policy[6],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 3,
            width: screen.width,
            color: ColorUiHelper.appSecondColor,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 25,
          ),
          Text("Haklar ve Sorumluluklar",
              style: TextStyleHelper.policyTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 20,
          ),
          Text("Telif Hakları:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.copyright[0],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("Kullanım Koşulları:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.copyright[1],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("Sorumluluk Sınırları:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.copyright[2],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("Değişiklik ve Güncellemeler:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.copyright[3],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          Text("Uygulanabilir Kanunlar:",
              style: TextStyleHelper.policySubTitleStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.copyright[4],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 15,
          ),
          Text(TextSet.copyright[5],
              style: TextStyleHelper.policyContentStyle,
              textAlign: TextAlign.center),
        ]),
        Positioned(
            top: 35,
            child: GoBackPageButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 36,
                color: ColorUiHelper.policyTitleColor,
              ),
            ))
      ],
    );
  }
}
