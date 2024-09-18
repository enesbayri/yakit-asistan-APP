import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:yakit_asistan/database/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/models/trip.dart';

class HiveDatabase extends Database {
  Box? box;
  HiveDatabase() {
    box = Hive.box("FuelAssistant");
  }

  Future<void> addCarStorage(Car car) async {
    List? cars = [];

    if (box!.get("cars") != null) {
      cars = jsonDecode(box!.get("cars"));
    }
    cars!.add(car.toMap());
    await box!.put("cars", jsonEncode(cars));
  }

  Future<void> addTripStorage(Trip trip) async {
    List? trips = [];

    if (box!.get("trips") != null) {
      trips = jsonDecode(box!.get("trips"));
    }
    trips!.insert(0, trip.toMap()); // Listede başa ekler her eklenen seyahati
    await box!.put("trips", jsonEncode(trips));
  }

  Future<void> syncCarsToLocalDB(List<Car> cars) async {
    List<Car> localCars = getCarsfromStorage();
    List<Car> filteredCars = [];
    for (var car in cars) {
      bool filtered = localCars.any((element) {
        debugPrint(car.name);
        debugPrint(element.name);
        return car.name == element.name;
      });
      if (filtered == false) {
        debugPrint("kaydetti");
        filteredCars.add(car);
      }
    }
    if (filteredCars.isNotEmpty) {
      localCars.addAll(filteredCars);
      await updateCarStorage(localCars);
    }
  }

  Future<void> syncTripsToLocalDB(List<Trip> trips) async {
    List<Trip> localTrips = getTripsfromStorage();
    localTrips.addAll(trips);
    await updateTripStorage(localTrips);
  }

  List<Car> getCarsfromStorage() {
    List<Car> getcars = [];
    if (box!.isNotEmpty) {
      if (box!.get("cars") != null) {
        List data = jsonDecode(box!.get("cars"));
        for (int i = 0; i < data.length; i++) {
          getcars.add(Car.fromMap(data[i]));
        }
      }
    }
    return getcars;
  }

  List<Trip> getTripsfromStorage() {
    List<Trip> getTrips = [];
    if (box!.isNotEmpty) {
      if (box!.get("trips") != null) {
        List data = jsonDecode(box!.get("trips"));
        for (int i = 0; i < data.length; i++) {
          getTrips.add(Trip.fromMap(data[i]));
        }
      }
    }
    return getTrips;
  }

  Future<void> updateCarStorage(List<Car> cars) async {
    await box!.put("cars", jsonEncode(cars.map((e) => e.toMap()).toList()));
  }

  Future<void> updateTripStorage(List<Trip> trips) async {
    await box!.put("trips", jsonEncode(trips.map((e) => e.toMap()).toList()));
  }

  Future<void> addTripToCar(Trip trip) async {
    List<Car> cars = getCarsfromStorage();
    Car.seachCarfromName(trip.carName, cars).addTrip(trip);
    await updateCarStorage(cars);
  }

  Future<void> editCar(Car lastCar, Car newCar) async {
    List<Car> cars = getCarsfromStorage();
    List<Trip> trips = getTripsfromStorage();

    int editIndex = cars.indexWhere((car) => car.name == lastCar.name);

    trips = trips.map((t) {
      if (t.carName == lastCar.name) {
        t.carName = newCar.name;
      }
      return t;
    }).toList();

    cars[editIndex] = Car.editCar(lastCar, newCar);

    await updateCarStorage(cars);
    await updateTripStorage(trips);
  }

  Future<void> deleteCar(Car currentCar) async {
    try {
      List<Car> cars = getCarsfromStorage();
      int lastCount = cars.length;
      cars.removeWhere((car) => car.name == currentCar.name);
      int newCount = cars.length;
      if (lastCount != newCount) {
        if(currentCar.imageUrl.contains("https")==false){
          await File(currentCar.imageUrl).delete();
        }
      }
      await updateCarStorage(cars);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTrip(String carName, int tripId) async {
    List<Car> cars = getCarsfromStorage();
    List<Trip> trips = getTripsfromStorage().reversed.toList(); //liste gösterim olarak lokalden ters geldiği için çevrilir.

    Car? car = Car.seachCarfromName(carName, cars);
    if (car.name != "") {
      car.deleteTrip(trips[tripId]);
    }
    trips.removeAt(tripId);

    await updateCarStorage(cars);
    await updateTripStorage(trips.reversed.toList()); //liste tekrar ters kaydedilir.
  }

  bool getDatabaseRouter() {
    bool isLocal = false;
    if (box!.isNotEmpty) {
      if (box!.get("isLocal") != null) {
        isLocal = jsonDecode(box!.get("isLocal"));
      }
    }
    return isLocal;
  }

  Future<void> setDatabaseRouter(bool isLocal) async {
    await box!.put("isLocal", jsonEncode(isLocal));
  }

  DateTime? getLastGetRequestApi() {
    if (box!.isNotEmpty) {
      DateTime? lastTime = box!.get("lastRequest");
      if (lastTime != null) {
        return lastTime;
      }
    }
    return null;
  }

  Future<void> setLastGetRequestApi(DateTime dt) async {
    await box!.put("lastRequest", dt);
  }

  Future<void> setShellCostsToDB(Map costs) async {
    await box!.put("shell", costs);
  }

  Future<void> setOpetCostsToDB(Map costs) async {
    await box!.put("opet", costs);
  }

  Future<void> setSoilCostsToDB(Map costs) async {
    await box!.put("soil", costs);
  }

  Future<void> setGoCostsToDB(Map costs) async {
    await box!.put("go", costs);
  }

  Future<void> setPoCostsToDB(Map costs) async {
    await box!.put("po", costs);
  }

  Future<void> setTpCostsToDB(Map costs) async {
    await box!.put("tp", costs);
  }

  Future<void> setMoilCostsToDB(Map costs) async {
    await box!.put("moil", costs);
  }

  Future<void> setAytemizCostsToDB(Map costs) async {
    await box!.put("aytemiz", costs);
  }

  Future<Map<String, Map>> getFuelCostsFromDB(List<String> companies) async {
    Map<String, Map> costs = {};
    if (box!.isNotEmpty) {
      for (var comp in companies) {
        if (box!.get(comp) != null) {
          Map<String, Map> cost = {};
          cost[comp] = box!.get(comp);
          costs.addEntries(cost.entries);
        }
      }
    }
    return costs;
  }
}

Future<void> hiveSetup() async {
  await Hive.initFlutter("FuelAssistant");
  await Hive.openBox("FuelAssistant");
}
