import 'package:flutter/material.dart';
import 'package:yakit_asistan/views/calculatepages/fueltodistpage/bottom_scroll.dart';
import 'package:yakit_asistan/views/calculatepages/fueltodistpage/calc_button.dart';
import 'package:yakit_asistan/views/calculatepages/fueltodistpage/top_scroll.dart';
import 'package:yakit_asistan/views/commonwidgets/calc_page_header.dart';

class FuelToDistPageContent extends StatelessWidget {
  const FuelToDistPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalcPagesHeader(title: "Ne Kadar Yol Gider?"),
        const SizedBox(
          height: 20,
        ),
        const FuelToDistPageTopScrollWidget(),
        const SizedBox(
          height: 50,
        ),
        const FuelToDistBottomScrollWidget(),
        const SizedBox(
          height: 20,
        ),
        const FuelToDistCalculateButton(),
      ],
    );
  }
}
