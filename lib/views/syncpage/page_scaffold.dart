import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yakit_asistan/bloc/dataSyncBloc/sync_bloc.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/syncpage/page_content.dart';

class SynchroPageScaffold extends StatelessWidget {
  SynchroPageScaffold({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataSyncBloc(),
      child: Scaffold(
        backgroundColor: ColorUiHelper.syncPageBgColor,
        body: SafeArea(
          child: Container(
            height: screen.height,
            width: screen.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/sync/bg.gif"), opacity: 0.3)),
            child: const SynchroPageContents(),
          ),
        ),
      ),
    );
  }
}
