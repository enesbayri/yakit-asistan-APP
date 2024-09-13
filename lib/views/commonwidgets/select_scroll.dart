// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/scroll_hortizonal_widget.dart';

class SelectScrollRowWithLabel extends ConsumerStatefulWidget {
  SelectScrollRowWithLabel(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.selectedIndex,
      required this.children,
      required this.onChanged});

  final String title;
  List<int> children;
  int selectedIndex;
  Function(int index) onChanged;
  final String subtitle;

  @override
  ConsumerState<SelectScrollRowWithLabel> createState() =>
      _SelectScrollRowWithLabelState();
}

class _SelectScrollRowWithLabelState
    extends ConsumerState<SelectScrollRowWithLabel> {
  late TextEditingController textController;
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: "${widget.selectedIndex}");
    controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    bool isLabelActive = ref.watch(isLabelActiveProvider);
    return Row(
      children: [
        Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 8),
                    child: Text(
                      widget.title,
                      style: TextStyleHelper.tripsCardSubtitleStyle,
                    ),
                  ),
                  ScrollHortizonalWidget(
                    controller: controller,
                    children: widget.children,
                    disabledColor: ColorUiHelper.calcutesdisabledScrollColor,
                    enabledColor: ColorUiHelper.appSecondColor,
                    height: 70,
                    width: 300,
                    selectedIndex: widget.selectedIndex - 1,
                    onChanged: (index) {
                      setState(() {
                        widget.selectedIndex = index + 1;
                        widget.onChanged(widget.selectedIndex);
                      });
                    },
                  ),
                ],
              ),
            )),
        Expanded(
            flex: 3,
            child: InkWell(
              onTap: () {
                setState(() {
                  ref.read(isLabelActiveProvider.notifier).state =
                      (!isLabelActive);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (isLabelActive)
                      ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: ColorUiHelper.appBgColor),
                          child: TextField(
                            controller: textController,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              setState(() {
                                if (value != "") {
                                  widget.selectedIndex = int.parse(value);
                                  controller.animateTo(
                                      (widget.selectedIndex.toDouble() - 1) *
                                          55,
                                      curve: Curves.bounceIn,
                                      duration: Durations.short2);
                                }
                              });
                            },
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32),
                                  borderSide: BorderSide(
                                      color: ColorUiHelper.appMainColor,
                                      width: 2)),
                            ),
                            style: TextStyleHelper.textInputStyle,
                          ),
                        )
                      : Text(
                          "${widget.selectedIndex}",
                          style: TextStyleHelper.calcPageCardInputStyle,
                        ),
                  Text(
                    widget.subtitle,
                    style: TextStyleHelper.calcPageCardInputLabelStyle,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
