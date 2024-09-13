import 'package:yakit_asistan/database/hive_database.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';

class DatabaseRouterRepository {
  HiveDatabase db = locator<HiveDatabase>();

  bool isLocalDbRouter() {
    return db.getDatabaseRouter();
  }

  Future<void> setDatabaseRouter(bool isLocal) async {
    await db.setDatabaseRouter(isLocal);
  }
}
