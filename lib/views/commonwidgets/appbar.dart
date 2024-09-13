import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yakit_asistan/bloc/networkBloc/net_bloc.dart';
import 'package:yakit_asistan/bloc/networkBloc/net_state.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/appbar_menu_button.dart';

class Appbar {
  static PreferredSizeWidget getAppBar(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        leading: AppBarMenuButton(
          onPressed: () {
            if (AnimationControll.controller.status ==
                AnimationStatus.completed) {
              AnimationControll.controller.reverse().orCancel;
            } else {
              AnimationControll.controller.forward().orCancel;
            }
          },
        ),
        actions: [
          BlocBuilder<NetworkBloc, NetworkState>(
            builder: (context, state) {
              bool isLocal = state is ServerNetworkState ? false : true;
              return IconButton(
                icon: Icon(Icons.data_usage_rounded,
                    color: ColorUiHelper.appMainColor),
                color: ColorUiHelper.appMainColor,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(isLocal == true
                        ? "Çevrimdışı Moddasınız!"
                        : "Çevrimiçi Moddasınız!"),
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.horizontal,
                    showCloseIcon: true,
                  ));
                },
              );
            },
          )
        ],
        title: Text(
          "Yakıt Asistan",
          style: TextStyleHelper.appbarStyle,
        ),
        titleSpacing: 0,
      );

  static PreferredSizeWidget getCalcPagesAppBar = AppBar(
    backgroundColor: Colors.white,
    leading: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Image.asset("assets/icons/mainIcon.png"),
    ),
    title: Text(
      "Yakıt Asistan",
      style: TextStyleHelper.appbarStyle,
    ),
    titleSpacing: 0,
  );

  static PreferredSizeWidget getAddPageAppBar = AppBar(
    backgroundColor: ColorUiHelper.appTransparentColor,
    leading: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Image.asset("assets/icons/mainIcon.png")),
    title: Text(
      "Yakıt Asistan",
      style: TextStyleHelper.appbarSecondStyle,
    ),
    titleSpacing: 0,
  );
}
