import 'package:flutter/material.dart';
import 'package:yakit_asistan/views/calculatepages/consumppage/bottom_scroll_widget.dart';
import 'package:yakit_asistan/views/calculatepages/consumppage/calc_button.dart';
import 'package:yakit_asistan/views/calculatepages/consumppage/cost_input.dart';
import 'package:yakit_asistan/views/calculatepages/consumppage/liter_to_tl_button.dart';
import 'package:yakit_asistan/views/calculatepages/consumppage/top_scroll_widget.dart';
import 'package:yakit_asistan/views/commonwidgets/calc_page_header.dart';

class ConsumpPageContent extends StatelessWidget {
  const ConsumpPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalcPagesHeader(title: "Aracım Ne Kadar Yakıyor?"),
        const ConsumpPageTopScrollWidget(),
        const LiterToTLButton(),
        FuelCostInput(),
        const SizedBox(
          height: 50,
        ),
        const ConsumpPageBottomScrollWidget(),
        const SizedBox(
          height: 20,
        ),
        const ConsumpPageCalculateButton(),
      ],
    );
  }
}
