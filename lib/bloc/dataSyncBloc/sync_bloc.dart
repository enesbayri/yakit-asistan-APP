import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/repository/sync_repository.dart';

import './bloc.dart';

class DataSyncBloc extends Bloc<SyncEvent, SyncState> {
  final SyncRepository sync = locator<SyncRepository>();

  DataSyncBloc() : super(InitialState()) {
    on<DataSyncToLocalEvent>((event, emit) async {
      emit(ProgressSyncState());
      try {
        await sync.syncCarsToLocalDB();
        await sync.syncTripsToLocalDB();
        emit(SynchronizedState());
        await Future.delayed(const Duration(milliseconds: 2500));
        emit(CompletedSyncState());
      } catch (e) {
        emit(ErrorSyncState());
        await Future.delayed(const Duration(milliseconds: 2500));
        emit(CompletedSyncState());
      }
    });

    on<DataSyncToServerEvent>((event, emit) async {
      emit(ProgressSyncState());
      try {
        await sync.syncCarsToServer();
        await sync.syncTripsToServer();
        emit(SynchronizedState());
        await Future.delayed(const Duration(milliseconds: 2500));
        emit(CompletedSyncState());
      } catch (e) {
        emit(ErrorSyncState());
        await Future.delayed(const Duration(milliseconds: 2500));
        emit(CompletedSyncState());
      }
    });
  }
}
