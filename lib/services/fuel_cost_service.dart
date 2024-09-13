// ignore_for_file: avoid_init_to_null

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:mongo_dart/mongo_dart.dart';

class FuelCostApi {
  List<String> cityList = [
    "adana",
    "adiyaman",
    "afyon",
    "agri",
    "aksaray",
    "amasya",
    "ankara",
    "antalya",
    "ardahan",
    "artvin",
    "aydin",
    "balikesir",
    "bartin",
    "batman",
    "bayburt",
    "bilecik",
    "bingol",
    "bitlis",
    "bolu",
    "burdur",
    "bursa",
    "canakkale",
    "cankiri",
    "corum",
    "denizli",
    "diyarbakir",
    "duzce",
    "edirne",
    "elazig",
    "erzincan",
    "erzurum",
    "eskisehir",
    "gaziantep",
    "giresun",
    "gumushane",
    "hakkari",
    "hatay",
    "igdir",
    "isparta",
    "istanbul",
    "izmir",
    "kahramanmaras",
    "karabuk",
    "karaman",
    "kars",
    "kastamonu",
    "kayseri",
    "kirikkale",
    "kirklareli",
    "kirsehir",
    "kilis",
    "kocaeli",
    "konya",
    "kutahya",
    "malatya",
    "manisa",
    "mardin",
    "mersin",
    "mugla",
    "mus",
    "nevsehir",
    "nigde",
    "ordu",
    "osmaniye",
    "rize",
    "sakarya",
    "samsun",
    "siirt",
    "sinop",
    "sivas",
    "sanliurfa",
    "sirnak",
    "tekirdag",
    "tokat",
    "trabzon",
    "tunceli",
    "usak",
    "van",
    "yalova",
    "yozgat",
    "zonguldak",
    "düzce"
  ];
  Db db = Db("");

  Future<void> startMongoDb() async {
    await db.close();
    if (!db.isConnected) {
      db = await Db.create(
          "mongodb+srv://root:root123@atlascluster.8mzc2g8.mongodb.net/?retryWrites=true&w=majority&appName=AtlasCluster");
      await db.open();
    }
  }

  Future<Map<String, dynamic>> getShellCosts() async {
    DbCollection coll = db.collection('petrols');
    var d = await coll.findOne(where.eq("company", "shell"));
    var costs = jsonDecode(d!["costs"]);
    Map<String, dynamic> filteredData = {};
    for (var data in costs) {
      try {
        if (data == null) continue;
        String resCity = data.keys.first as String;
        String addedCityName = cityList.firstWhere(
          (element) => resCity.contains(element),
          orElse: () {
            return "";
          },
        );
        if (addedCityName == "") {
          continue;
        } else {
          List<String> cost = [];
          cost.add(data[resCity][1]);
          cost.add(data[resCity][2]);
          cost.add(data[resCity][2]);
          cost.add(data[resCity][0]);
          filteredData[addedCityName] = cost;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return filteredData;
  }

  Future<Map<String, dynamic>> getOpetCosts() async {
    DbCollection coll = db.collection('petrols');
    var d = await coll.findOne(where.eq("company", "opet"));
    var dLpg = await coll.findOne(where.eq("company", "opetLpg"));
    var costs = jsonDecode(d!["costs"]);
    var costsLpg = jsonDecode(dLpg!["costs"]);

    Map<String, dynamic> filteredData = {};
    for (int i = 0; i < costsLpg.length; i++) {
      try {
        var dataLpg = costsLpg[i];
        String resCity = dataLpg.keys.first as String;
        var data = costs[resCity];
        if (data == null || dataLpg == null) continue;
        String addedCityName = cityList.firstWhere(
          (element) => resCity.contains(element),
          orElse: () {
            return "";
          },
        );
        if (addedCityName == "") {
          continue;
        } else {
          List<String> cost = [];
          cost.add(data[0]);
          cost.add(data[1]);
          cost.add(data[1]);
          cost.add(dataLpg[resCity]);
          filteredData[addedCityName] = cost;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return filteredData;
  }

  Future<Map<String, dynamic>> getSoilCosts() async {
    DbCollection coll = db.collection('petrols');
    var d = await coll.findOne(where.eq("company", "soil"));
    var dLpg = await coll.findOne(where.eq("company", "soilLpg"));
    var costs = jsonDecode(d!["costs"]);
    var costsLpg = jsonDecode(dLpg!["costs"]);

    Map<String, dynamic> filteredData = {};
    for (int i = 0; i < costs.length; i++) {
      try {
        var data = costs[i];
        var dataLpg = costsLpg[i];
        if (data == null || dataLpg == null) continue;
        String resCity = data.keys.first as String;
        String addedCityName = cityList.firstWhere(
          (element) => resCity.contains(element),
          orElse: () {
            return "";
          },
        );
        if (addedCityName == "") {
          continue;
        } else {
          List<String> cost = [];
          cost.add(data[resCity][0]);
          cost.add(data[resCity][1]);
          cost.add(data[resCity][1]);
          if (dataLpg == null) {
            cost.add(("00.00"));
          } else {
            String lpgCity = cityList.firstWhere(
              (element) => dataLpg.keys.first.contains(element),
              orElse: () {
                return "";
              },
            );
            if (lpgCity != "") {
              cost.add((dataLpg[lpgCity] ?? "00.00"));
            } else {
              cost.add(("00.00"));
            }
          }

          filteredData[addedCityName] = cost;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return filteredData;
  }

  Future<Map<String, dynamic>> getGoCosts() async {
    DbCollection coll = db.collection('petrols');
    var d = await coll.findOne(where.eq("company", "go"));
    var costs = jsonDecode(d!["costs"]);
    Map<String, dynamic> filteredData = {};
    for (var data in costs) {
      try {
        if (data == null) continue;
        String resCity = data.keys.first as String;
        String addedCityName = cityList.firstWhere(
          (element) => resCity.contains(element),
          orElse: () {
            return "";
          },
        );
        if (addedCityName == "") {
          continue;
        } else {
          List<String> cost = [];
          cost.add(data[resCity][0]);
          cost.add(data[resCity][1]);
          cost.add(data[resCity][1]);
          cost.add(data[resCity][3]);
          filteredData[addedCityName] = cost;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return filteredData;
  }

  Future<Map<String, dynamic>> getPoCosts() async {
    DbCollection coll = db.collection('petrols');
    var d = await coll.findOne(where.eq("company", "po"));
    var costs = jsonDecode(d!["costs"]);
    Map<String, dynamic> filteredData = {};

    for (int i = 0; i < costs.keys.length; i++) {
      try {
        String resCity = costs.keys.elementAt(i) as String;
        var data = costs[resCity];
        if (data == null) continue;
        String addedCityName = cityList.firstWhere(
          (element) => resCity.contains(element),
          orElse: () {
            return "";
          },
        );
        if (addedCityName == "") {
          continue;
        } else {
          List<String> cost = [];
          cost.add(data[0]);
          cost.add(data[1]);
          cost.add(data[2]);
          cost.add(data[3]);
          filteredData[addedCityName] = cost;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return filteredData;
  }

  Future<Map<String, dynamic>> getTpCosts() async {
    DbCollection coll = db.collection('petrols');
    var d = await coll.findOne(where.eq("company", "tp"));
    var costs = jsonDecode(d!["costs"]);

    Map<String, dynamic> filteredData = {};
    for (var data in costs) {
      try {
        if (data == null) continue;
        String resCity = data.keys.first as String;
        String addedCityName = cityList.firstWhere(
          (element) => resCity.contains(element),
          orElse: () {
            return "";
          },
        );
        if (addedCityName == "") {
          continue;
        } else {
          List<String> cost = [];
          cost.add(data[resCity][0]);
          cost.add(data[resCity][2]);
          cost.add(data[resCity][2]);
          cost.add(data[resCity][7]);
          filteredData[addedCityName] = cost;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return filteredData;
  }

  Future<Map<String, dynamic>> getMoilCosts() async {
    DbCollection coll = db.collection('petrols');
    var d = await coll.findOne(where.eq("company", "moil"));
    var costs = jsonDecode(d!["costs"]);
    Map<String, dynamic> filteredData = {};
    for (var data in costs) {
      try {
        if (data == null) continue;
        String resCity = data.keys.first as String;
        String addedCityName = cityList.firstWhere(
          (element) => resCity.contains(element),
          orElse: () {
            return "";
          },
        );
        if (addedCityName == "") {
          continue;
        } else {
          List<String> cost = [];
          cost.add(data[resCity][0]);
          cost.add(data[resCity][2]);
          cost.add(data[resCity][2]);
          cost.add(data[resCity][6]);
          filteredData[addedCityName] = cost;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return filteredData;
  }

  Future<Map<String, dynamic>> getAytemizCosts() async {
    DbCollection coll = db.collection('petrols');
    var d = await coll.findOne(where.eq("company", "aytemiz"));
    var dLpg = await coll.findOne(where.eq("company", "aytemizLpg"));
    var costs = jsonDecode(d!["costs"]);
    var costsLpg = jsonDecode(dLpg!["costs"]);

    Map<String, dynamic> filteredData = {};
    for (int i = 0; i < costs.length; i++) {
      try {
        var data = costs[i];
        if (data == null) continue;
        var dataLpg = null;
        if (i < costsLpg.length) {
          dataLpg = costsLpg[i];
        }
        String resCity = data.keys.first as String;
        String addedCityName = cityList.firstWhere(
          (element) => resCity.contains(element),
          orElse: () {
            return "";
          },
        );
        if (addedCityName == "") {
          continue;
        } else {
          List<String> cost = [];
          cost.add(data[resCity][0]);
          cost.add(data[resCity][1]);
          cost.add(data[resCity][1]);
          if (dataLpg != null) {
            cost.add((dataLpg[resCity] ?? "00.00"));
          } else {
            cost.add(("00.00"));
          }

          filteredData[addedCityName] = cost;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return filteredData;
  }
}
