// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/networkBloc/net_bloc.dart';
import 'package:yakit_asistan/bloc/networkBloc/net_event.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/repository/database_router_repo.dart';
import 'package:yakit_asistan/views/commonwidgets/animated_menu_button.dart';

class MyProfileButton extends ConsumerWidget {
  const MyProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedMenuButton(
      title: "Profilim",
      icon: Icons.account_circle_rounded,
      onPressed: () async {
        var dbRouter = locator<DatabaseRouterRepository>();
        bool isLocal = dbRouter.isLocalDbRouter();
        if (isLocal) {
          await dbRouter.setDatabaseRouter(false);
          context.read<NetworkBloc>().add(NetworkControllEvent());
          //ref.read(updateDatabaseRouterProvider.notifier).state++;
          Navigator.of(context).pushNamed("HomePage");
        } else {
          Navigator.of(context).pushNamed("MyProfilePage");
        }
      },
    );
  }
}
