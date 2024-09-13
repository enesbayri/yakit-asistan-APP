import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/calculatepages/calculatespage/router_card.dart';

class CalcutesPageContent extends StatelessWidget {
  CalcutesPageContent({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width,
      height: screen.height,
      child: Column(
        children: [
          SizedBox(
            width: screen.width,
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calculate,
                    color: ColorUiHelper.appMainColor,
                    size: 32,
                  ),
                ),
                Text(
                  "Hesaplamalar",
                  style: TextStyleHelper.cardHeaderStyle,
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("ConsumpPage");
              },
              child: CalcutesPageCard(
                title: "Aracım ne kadar yakıyor?",
                subtitle: "Ortalama yakıt tüketiminizi hesaplayın.",
                icon: Icons.local_gas_station,
              )),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("DistToCostPage");
              },
              child: CalcutesPageCard(
                title: "Yol ne kadar tutar?",
                subtitle: "Gideceğiniz yolun maliyetini hesaplayın.",
                icon: Icons.currency_lira_rounded,
              )),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("FuelToDistPage");
              },
              child: CalcutesPageCard(
                title: "Kaç km giderim?",
                subtitle: "Depodaki yakıtla kaç km gideceğinizi hesaplayın.",
                icon: Icons.earbuds_rounded,
              )),
        ],
      ),
    );
  }
}
