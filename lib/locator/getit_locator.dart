import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yakit_asistan/authentication/firebase_auth.dart';
import 'package:yakit_asistan/database/firebase_cloudstorage.dart';
import 'package:yakit_asistan/database/firebase_firestore.dart';
import 'package:yakit_asistan/database/hive_database.dart';
import 'package:yakit_asistan/repository/cloudstore_repo.dart';
import 'package:yakit_asistan/repository/database_router_repo.dart';
import 'package:yakit_asistan/repository/fuel_assistant_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:yakit_asistan/repository/fuel_costs_api_repo.dart';
import 'package:yakit_asistan/repository/sync_repository.dart';
import 'package:yakit_asistan/router/url_router.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/services/fuel_cost_service.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';

final locator = GetIt.instance;

void getitSetup() {
  locator.registerLazySingleton(() => UrlLauncher());
  locator.registerLazySingleton(() => HiveDatabase());
  locator.registerLazySingleton(() => FuelAssistantRepository());
  locator.registerLazySingleton(() => FirebaseAuthentication());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => FirestoreDatabase());
  locator.registerLazySingleton(() => InternetConnectionChecker());
  locator.registerLazySingleton(() => DatabaseRouterRepository());
  locator.registerLazySingleton(() => ScreenSizeHelper(width: 0, height: 0));
  locator.registerLazySingleton(() => SyncRepository());
  locator.registerLazySingleton(() => FuelCostApi());
  locator.registerLazySingleton(() => FuelCostsApiRepository());
  locator.registerLazySingleton(() => CloudstoreDatabase());
  locator.registerLazySingleton(() => CloudstoreRepository());
}

void startScreenSized(double screenWidth, double screenHeight) {
  locator<ScreenSizeHelper>().height = screenHeight;
  locator<ScreenSizeHelper>().width = screenWidth;
}
