// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/networkBloc/net_bloc.dart';
import 'package:yakit_asistan/bloc/networkBloc/net_event.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/repository/database_router_repo.dart';
import 'package:yakit_asistan/views/authpages/widgets/back_button.dart';

class DbRouterChangeRegister extends ConsumerWidget {
  const DbRouterChangeRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topRight,
      child: BackFromLoginAndRegisterPage(
        onPressed: () async {
          var dbRouterRepo = locator<DatabaseRouterRepository>();
          await dbRouterRepo.setDatabaseRouter(true);
          context.read<NetworkBloc>().add(NetworkControllEvent());
          ref.read(updateDatabaseRouterProvider.notifier).state++;
          Navigator.of(context).pushReplacementNamed("LocalHomePage");
        },
      ),
    );
  }
}
