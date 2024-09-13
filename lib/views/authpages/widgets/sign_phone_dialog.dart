import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/authpages/widgets/screen_titles.dart';

class SignPhoneDialog {
  static getCodeDialog(
      BuildContext context, void Function(String pin)? onCompleted) {
    return showDialog(
        context: context,
        builder: (context) {
          Color borderColor = ColorUiHelper.appSecondColor;
          final defaultPinTheme = PinTheme(
            width: 56,
            height: 56,
            textStyle: TextStyleHelper.smsCodeStyle,
            decoration: const BoxDecoration(),
          );

          final cursor = Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 56,
                height: 3,
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          );
          final preFilledWidget = Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 56,
                height: 3,
                decoration: BoxDecoration(
                  color: ColorUiHelper.appMainColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          );
          return Material(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const LoginRegisterSubtitle(text: "Sms kodunu girin!"),
                const SizedBox(
                  height: 100,
                ),
                Pinput(
                  length: 6,
                  controller: TextControllerHelper.phoneSmsCodeController,
                  defaultPinTheme: defaultPinTheme,
                  showCursor: true,
                  cursor: cursor,
                  preFilledWidget: preFilledWidget,
                  validator: (s) {
                    return s != '' ? null : 'Lütfen Pini Girin';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  onCompleted: onCompleted,
                ),
              ],
            ),
          );
        });
  }

  static showPhoneNumberDialog(
      BuildContext context, void Function()? onSubmit) {
    var screen = locator<ScreenSizeHelper>();
    return showDialog(
        context: context,
        builder: (context) {
          return Material(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const LoginRegisterSubtitle(text: "Telefon numaranızı girin!"),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: screen.width * 0.65,
                  height: 50,
                  child: TextField(
                    controller: TextControllerHelper.phoneNumbercontroller,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: ColorUiHelper.appMainColor, width: 2)),
                      prefixText: "+90 ",
                      label: Text("Telefon Numarası",
                          style: TextStyleHelper.phoneSignInLabelStyle),
                      labelStyle: TextStyleHelper.textInputPhoneSignStyle,
                      suffix: IconButton(
                        icon: Icon(Icons.send_to_mobile,
                            color: ColorUiHelper.appMainColor),
                        onPressed: onSubmit,
                      ),
                    ),
                    style: TextStyleHelper.textInputStyle,
                  ),
                )
              ],
            ),
          );
        });
  }
}
