import 'package:yakit_asistan/database/hive_database.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/services/fuel_cost_service.dart';

class FuelCostsApiRepository {
  final List<String> _companies = [
    "shell",
    "opet",
    "soil",
    "go",
    "po",
    "tp",
    "moil",
    "aytemiz"
  ];

  Future<void> getNewFuelCostsFromApi() async {
    FuelCostApi costApi = locator<FuelCostApi>();
    HiveDatabase db = locator<HiveDatabase>();
    await costApi.startMongoDb();
    db.setShellCostsToDB((await costApi.getShellCosts()));
    db.setOpetCostsToDB((await costApi.getOpetCosts()));
    db.setSoilCostsToDB((await costApi.getSoilCosts()));
    db.setGoCostsToDB((await costApi.getGoCosts()));
    db.setPoCostsToDB((await costApi.getPoCosts()));
    db.setTpCostsToDB((await costApi.getTpCosts()));
    db.setMoilCostsToDB((await costApi.getMoilCosts()));
    db.setAytemizCostsToDB((await costApi.getAytemizCosts()));
  }

  Future<Map<String, Map>> getFuelCostsFromDB() async {
    HiveDatabase db = locator<HiveDatabase>();
    var costs = await db.getFuelCostsFromDB(_companies);
    if (costs.isEmpty) {
      await getNewFuelCostsFromApi();
    }
    return await db.getFuelCostsFromDB(_companies);
  }
}
