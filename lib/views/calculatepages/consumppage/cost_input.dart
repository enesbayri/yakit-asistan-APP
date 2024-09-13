import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class FuelCostInput extends ConsumerWidget {
  FuelCostInput({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLiter = ref.watch(isLiterProvider);
    return (isLiter)
        ? Container()
        : Row(
            children: [
              SizedBox(
                width: screen.width / 2,
                child: TextField(
                  controller: TextControllerHelper.fuelCostController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                    TextInputFormatter.withFunction(
                      (oldValue, newValue) => newValue.copyWith(
                        text: newValue.text.replaceAll(',', '.'),
                      ),
                    ),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(
                            color: ColorUiHelper.appMainColor, width: 2)),
                    label: Text("Yakıt Kaç TL",
                        style: TextStyleHelper.myCarsSortButtonsStyle),
                    labelStyle: TextStyleHelper.textInputStyle,
                  ),
                  style: TextStyleHelper.textInputStyle,
                ),
              ),
            ],
          );
  }
}
