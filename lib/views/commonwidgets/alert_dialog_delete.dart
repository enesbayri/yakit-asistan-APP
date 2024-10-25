import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class AlertDialogForDelete {
  static showDeleteAlertDialog(
          {required BuildContext context,
          required VoidCallback onDeletePressed,
          required VoidCallback onBackPressed,
          required String title,
          Widget? content}) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
                title: Text(
                  title,
                  style: TextStyleHelper.showWarningCardTitle,
                ),
                content: content,
                actions: [
                  TextButton.icon(
                      onPressed: onDeletePressed,
                      icon: Icon(
                        Icons.delete,
                        color: ColorUiHelper.appBgColor,
                      ),
                      label: Text(
                        "Sil",
                        style: TextStyleHelper.alertDialogDeleteButton,
                      ),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              ColorUiHelper.carsSortColor))),
                  TextButton.icon(
                      onPressed: onBackPressed,
                      icon: Icon(
                        Icons.close_rounded,
                        color: ColorUiHelper.appMainColor,
                      ),
                      label: Text("Vazgeç",
                          style: TextStyleHelper.alertDialogBackButton)),
                ],
              ));

  static showWarningDialog(
          {required BuildContext context,
          required VoidCallback onButtonPressed,
          required String title,
          Widget? content}) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
                title: Text(
                  title,
                  style: TextStyleHelper.showWarningCardTitle,
                ),
                content: content,
                actions: [
                  TextButton.icon(
                      onPressed: onButtonPressed,
                      icon: Icon(
                        Icons.task_alt,
                        color: ColorUiHelper.appMainColor,
                      ),
                      label: Text("Anladım",
                          style: TextStyleHelper.alertDialogBackButton)),
                ],
              ));
}
