// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class ScrollHortizonalWidget extends StatefulWidget {
  ScrollHortizonalWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.enabledColor,
      required this.disabledColor,
      required this.children,
      required this.onChanged,
      required this.selectedIndex,
      required this.controller});

  final double width;
  final double height;
  final Color enabledColor;
  final Color disabledColor;
  final List<int> children;
  void Function(int index) onChanged;
  final int selectedIndex;
  final ScrollController controller;

  @override
  State<ScrollHortizonalWidget> createState() => _ScrollHortizonalWidgetState();
}

class _ScrollHortizonalWidgetState extends State<ScrollHortizonalWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: RotatedBox(
          quarterTurns: -1,
          child: ListWheelScrollView(
            controller: widget.controller,
            perspective: 0.0001,
            itemExtent: 55,
            onSelectedItemChanged: (newIndex) async {
              setState(() {
                selectedIndex = newIndex;
                widget.onChanged(newIndex);
              });
            },
            children: List.generate(
              widget.children.length,
              (index) => RotatedBox(
                quarterTurns: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${widget.children[index]}",
                      style: TextStyleHelper.horizontalScroolStyle(
                          index == selectedIndex ? true : false),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 10),
                          width: 5,
                          height: index == selectedIndex ? 13 : 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? widget.enabledColor
                                : widget.disabledColor,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 50),
                          width: 5,
                          height: index == selectedIndex ? 16 : 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? widget.enabledColor
                                : widget.disabledColor,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: 5,
                          height: index == selectedIndex ? 19 : 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? widget.enabledColor
                                : widget.disabledColor,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: 5,
                          height: index == selectedIndex ? 23 : 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? widget.enabledColor
                                : widget.disabledColor,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: 5,
                          height: index == selectedIndex ? 19 : 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? widget.enabledColor
                                : widget.disabledColor,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 50),
                          width: 5,
                          height: index == selectedIndex ? 16 : 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? widget.enabledColor
                                : widget.disabledColor,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 10),
                          width: 5,
                          height: index == selectedIndex ? 13 : 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: index == selectedIndex
                                ? widget.enabledColor
                                : widget.disabledColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
