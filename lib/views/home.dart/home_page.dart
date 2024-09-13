import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/dataBloc/bloc.dart';
import 'package:yakit_asistan/bloc/networkBloc/net_bloc.dart';
import 'package:yakit_asistan/bloc/networkBloc/net_event.dart';
import 'package:yakit_asistan/bloc/networkBloc/net_state.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/authpages/login_page/login_page.dart';
import 'package:yakit_asistan/views/commonwidgets/loading_widget.dart';
import 'package:yakit_asistan/views/home.dart/auth_controll_page.dart';
import 'package:yakit_asistan/views/home.dart/page_navigation.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<NetworkBloc>().add(NetworkControllEvent());
    context.read<FuelAssistantBloc>().add(StartDatabaseEvent());
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(updateDatabaseRouterProvider);
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state is ConnectionNetworkState) {
          return Scaffold(
            body: LoadingWidget(isNotOpacity: true),
          );
        } else if (state is LocalNetworkState) {
          return const PageNavigation();
        } else if (state is ServerNetworkState) {
          return const AuthControllPage();
        } else if (state is ServerDisconnectedNetworkState) {
          return const PageNavigation();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
