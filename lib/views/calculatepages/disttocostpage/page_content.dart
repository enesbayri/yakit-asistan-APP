import 'package:flutter/material.dart';
import 'package:yakit_asistan/views/calculatepages/disttocostpage/bottom_scroll.dart';
import 'package:yakit_asistan/views/calculatepages/disttocostpage/calc_button.dart';
import 'package:yakit_asistan/views/calculatepages/disttocostpage/how_much_input.dart';
import 'package:yakit_asistan/views/calculatepages/disttocostpage/top_scroll.dart';
import 'package:yakit_asistan/views/commonwidgets/calc_page_header.dart';

class DistToCostPageContent extends StatelessWidget {
  const DistToCostPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalcPagesHeader(title: "Yol Ne Tutar?"),
        const SizedBox(
          height: 20,
        ),
        const DistToCostPageTopScrollWidget(),
        const SizedBox(
          height: 30,
        ),
        HowMuchFuelInput(),
        const SizedBox(
          height: 40,
        ),
        const DistToCostBottomScrollWidget(),
        const SizedBox(
          height: 20,
        ),
        const DistToCostCalculateButton(),
      ],
    );
  }
}
