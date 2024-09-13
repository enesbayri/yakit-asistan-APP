import 'package:flutter/cupertino.dart';
import 'package:yakit_asistan/database/hive_database.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/repository/fuel_costs_api_repo.dart';

void apiRequestControl() async {
  try {
    bool isGetRequest = await isGetRequestInToday();
    var costRepo = locator<FuelCostsApiRepository>();
    if (isGetRequest == false) {
      await costRepo.getNewFuelCostsFromApi();
    }
  } catch (e) {
    debugPrint("Start api error");
    debugPrint(e.toString());
  }
}

Future<bool> isGetRequestInToday() async {
  HiveDatabase db = locator<HiveDatabase>();
  DateTime? lastTime = db.getLastGetRequestApi();
  DateTime now = DateTime.now();
  if (lastTime != null) {
    DateTime startOfToday = DateTime(now.year, now.month, now.day);
    DateTime endOfToday =
        DateTime(now.year, now.month, now.day, 23, 59, 59, 999);
    if (lastTime.isAfter(startOfToday) && lastTime.isBefore(endOfToday)) {
      return true;
    } else {
      await db.setLastGetRequestApi(now);
      return false;
    }
  } else {
    await db.setLastGetRequestApi(now);
    return false;
  }
}
