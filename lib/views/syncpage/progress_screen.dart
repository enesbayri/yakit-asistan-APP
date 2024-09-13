import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataSyncBloc/sync_bloc.dart';
import 'package:yakit_asistan/bloc/dataSyncBloc/sync_state.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/syncpage/selected_db_card.dart';

class ProgressSyncScreen extends ConsumerWidget {
  ProgressSyncScreen({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<DataSyncBloc, SyncState>(
      builder: (context, state) {
        if (state is ProgressSyncState) {
          return Container(
            width: screen.width,
            height: screen.height,
            color: ColorUiHelper.appMainColor.withOpacity(0.2),
            child: const SyncSelectDBCard(
              imageUrl: "assets/sync/3.gif",
              radius: 200,
              padding: 80,
              borderRadius: 200,
              dbTag: "",
            ),
          );
        } else if (state is SynchronizedState) {
          return Container(
            width: screen.width,
            height: screen.height,
            color: ColorUiHelper.appMainColor.withOpacity(0.2),
            child: const SyncSelectDBCard(
              imageUrl: "assets/sync/4.gif",
              radius: 200,
              padding: 80,
              borderRadius: 200,
              dbTag: "",
            ),
          );
        } else if (state is ErrorSyncState) {
          Future.delayed(
            Duration.zero,
            () {
              ref.read(syncCurrenDBProvider.notifier).state = "SyncError";
            },
          );
          return Container(
            width: screen.width,
            height: screen.height,
            color: ColorUiHelper.appMainColor.withOpacity(0.2),
            child: const SyncSelectDBCard(
              imageUrl: "assets/sync/5.gif",
              radius: 200,
              padding: 80,
              borderRadius: 200,
              dbTag: "",
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
