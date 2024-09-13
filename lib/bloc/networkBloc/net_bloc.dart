import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yakit_asistan/bloc/networkBloc/bloc.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/repository/database_router_repo.dart';
import 'package:yakit_asistan/services/auth_service.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  var connection = locator<InternetConnectionChecker>();
  var dbRouter = locator<DatabaseRouterRepository>();
  final AuthService auth = locator<AuthService>();

  NetworkBloc() : super(ConnectionNetworkState()) {
    on<NetworkControllEvent>((event, emit) async {
      emit(ConnectionNetworkState());
      bool hasNetwork = await connection.hasConnection;
      bool isLocal = dbRouter.isLocalDbRouter();
      debugPrint("çalistiiiiii");
      if (isLocal) {
        emit(LocalNetworkState());
        debugPrint("111111111");
      } else {
        if (hasNetwork) {
          debugPrint("2222222222");
          emit(ServerNetworkState());
        } else {
          emit(ServerDisconnectedNetworkState());
          debugPrint("3333333333");
        }
      }
    });
  }
}
