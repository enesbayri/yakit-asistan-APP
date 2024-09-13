import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/alert_dialog_empty.dart';

class LogOutButton extends StatelessWidget {
  LogOutButton({
    super.key,
  });
  final AuthService auth = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorUiHelper.appMainColor.withOpacity(0.5),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ColorUiHelper.appMainColor.withOpacity(1),
              spreadRadius: 0.1,
              blurRadius: 5,
            ),
          ],
        ),
        child: IconButton(
          highlightColor: ColorUiHelper.appSecondColor,
          onPressed: () async {
            AlertDialogForEmptyDataControll.showLogOutDialog(
              context: context,
              accessButtonTitle: "Çıkış Yap",
              title: "Çıkış yapılsın mı?",
              onAccessPressed: () async {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                await auth.signOutUser();
              },
              onBackPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
          tooltip: "Çıkış Yap",
          icon: Icon(
            Icons.logout,
            color: ColorUiHelper.appBgColor,
            size: 24,
          ),
        ));
  }
}
