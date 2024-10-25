import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataSyncBloc/sync_bloc.dart';
import 'package:yakit_asistan/bloc/dataSyncBloc/sync_event.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class SyncStartButton extends ConsumerWidget {
  SyncStartButton({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? currentDB = ref.watch(syncCurrenDBProvider);
    return currentDB != null && currentDB != "synchronized"
        ? SizedBox(
            width: screen.width * 0.95,
            height: screen.height * 0.21,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    if (currentDB == "server") {
                      context.read<DataSyncBloc>().add(DataSyncToServerEvent());
                    } else if (currentDB == "local") {
                      context.read<DataSyncBloc>().add(DataSyncToLocalEvent());
                    }
                    ref.read(syncCurrenDBProvider.notifier).state =
                        "synchronized";
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          ColorUiHelper.syncPageMainColor),
                      overlayColor: WidgetStatePropertyAll(
                          ColorUiHelper.appSecondColor),
                      side: WidgetStatePropertyAll(BorderSide(
                          color: ColorUiHelper.appBgColor, width: 2)),
                      shadowColor: WidgetStatePropertyAll(
                          ColorUiHelper.syncPageMainColor)),
                  child: Text(
                    "Eşitle!",
                    style: TextStyleHelper.syncStartButtonStyle,
                  ),
                )
              ],
            ),
          )
        : Container();
  }
}
