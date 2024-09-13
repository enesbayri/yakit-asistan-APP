// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_event.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/animated_menu_button.dart';
import 'package:yakit_asistan/views/commonwidgets/profile_button.dart';

class AppMenu extends ConsumerWidget {
  const AppMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedBuilder(
      animation: AnimationControll.controller,
      builder: (context, child) => Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Transform.translate(
            offset: Offset(
                AnimationControll.sequenceAnimation["translateMenu"].value, 0),
            child: Transform.scale(
              scale: AnimationControll.sequenceAnimation["scaleMenu"].value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorUiHelper.appBgColor),
                          boxShadow: [
                            BoxShadow(
                                color: ColorUiHelper.appSecondColor,
                                blurRadius: 5,
                                spreadRadius: 5)
                          ],
                          color: ColorUiHelper.appMainColor),
                      child: Center(
                        child: Image.asset("assets/icons/mainIcon.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const MyProfileButton(),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedMenuButton(
                    title: "Senkronizasyon",
                    icon: Icons.cloud_sync_rounded,
                    onPressed: () async {
                      ref.read(syncCurrenDBProvider.notifier).state = null;
                      await Navigator.of(context).pushNamed("SynchroPage");
                      context
                          .read<FuelAssistantBloc>()
                          .add(RefreshDatabaseEvent());
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedMenuButton(
                    title: "Bize Ulaşın",
                    icon: Icons.support_agent,
                    onPressed: () {
                      Navigator.of(context).pushNamed("ContactUsPage");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedMenuButton(
                    title: "Hakkında",
                    icon: Icons.perm_device_info,
                    onPressed: () {
                      Navigator.of(context).pushNamed("AboutPage");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedMenuButton(
                    title: "Gizlilik İlkesi",
                    icon: Icons.privacy_tip,
                    onPressed: () {
                      Navigator.of(context).pushNamed("PolicyPage");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
