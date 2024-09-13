import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class AlertDialogForEmptyDataControll {
  static showDeleteAlertDialog(
          {required BuildContext context,
          required VoidCallback onAccessPressed,
          required VoidCallback onBackPressed,
          required String title}) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
                title: Text(
                  title,
                  style: TextStyleHelper.showWarningCardTitle,
                ),
                actions: [
                  TextButton.icon(
                      onPressed: onAccessPressed,
                      icon: Icon(
                        Icons.delete,
                        color: ColorUiHelper.appBgColor,
                      ),
                      label: Text(
                        "Araç Ekle",
                        style: TextStyleHelper.alertDialogDeleteButton,
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              ColorUiHelper.appMainColor))),
                  TextButton.icon(
                      onPressed: onBackPressed,
                      icon: Icon(
                        Icons.close_rounded,
                        color: ColorUiHelper.appSecondColor,
                      ),
                      label: Text("Vazgeç",
                          style: TextStyleHelper.alertDialogBackButton)),
                ],
              ));

  static showLogOutDialog(
          {required BuildContext context,
          required VoidCallback onAccessPressed,
          required String accessButtonTitle,
          required VoidCallback onBackPressed,
          required String title}) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
                title: Text(
                  title,
                  style: TextStyleHelper.showWarningCardTitle,
                ),
                actions: [
                  TextButton.icon(
                      onPressed: onAccessPressed,
                      icon: Icon(
                        Icons.delete,
                        color: ColorUiHelper.appBgColor,
                      ),
                      label: Text(
                        accessButtonTitle,
                        style: TextStyleHelper.alertDialogDeleteButton,
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              ColorUiHelper.carsSortColor))),
                  TextButton.icon(
                      onPressed: onBackPressed,
                      icon: Icon(
                        Icons.close_rounded,
                        color: ColorUiHelper.appSecondColor,
                      ),
                      label: Text("Vazgeç",
                          style: TextStyleHelper.alertDialogBackButton)),
                ],
              ));
  static showForgotPasswordLinkDialog(
          {required BuildContext context,
          required VoidCallback onAccessPressed,
          required String accessButtonTitle,
          required VoidCallback onBackPressed,
          required String title}) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
                title: Text(
                  title,
                  style: TextStyleHelper.showWarningCardTitle,
                ),
                actions: [
                  TextButton.icon(
                      onPressed: onAccessPressed,
                      icon: Icon(
                        Icons.mail_lock_outlined,
                        color: ColorUiHelper.appMainColor,
                      ),
                      label: Text(
                        accessButtonTitle,
                        style: TextStyleHelper.alertDialogBackButton,
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              ColorUiHelper.appSecondColor))),
                  TextButton.icon(
                      onPressed: onBackPressed,
                      icon: Icon(
                        Icons.close_rounded,
                        color: ColorUiHelper.appSecondColor,
                      ),
                      label: Text("Vazgeç",
                          style: TextStyleHelper.alertDialogBackButton)),
                ],
              ));
}
