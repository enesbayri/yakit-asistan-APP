import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/models/calc_consump.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/models/dist_to_cost.dart';
import 'package:yakit_asistan/models/fuel_to_dist.dart';
import 'package:yakit_asistan/models/trip.dart';

final isLiterProvider = StateProvider<bool>((ref) {
  return true;
});

final calcConsumpProvider =
    StateProvider((ref) => CalcConsump(fuel: 1, dist: 1));

final distToCostProvider =
    StateProvider((ref) => DistToCost(dist: 1, consump: 1));

final fuelToDistProvider =
    StateProvider((ref) => FuelToDist(fuel: 1, consump: 1));

final isLabelActiveProvider = StateProvider<bool>((ref) {
  return false;
});

final tripsPageSelectedCarProvider = StateProvider<String>((ref) {
  return "Tümü";
});

final detailPageSelectedCarProvider = StateProvider<Car>(
  (ref) => Car(
      name: "name",
      imageUrl: "imageUrl",
      model: 1,
      type: "type",
      transmission: "transmission",
      fuel: "fuel",
      totalDist: 1,
      consump: 1),
);

final myCarsPageNameInputProvider = StateProvider<String>((ref) => "");

final myCarsPageSortProvider = StateProvider<int>((ref) => 0);

final addCarProvider = StateProvider<Car>(
  (ref) => Car(
      name: "name",
      imageUrl: "assets/icons/addCarIcon.png",
      model: 2024,
      type: "Otomobil",
      transmission: "Manuel",
      fuel: "Benzin",
      totalDist: 0,
      consump: 0),
);

final addTripProvider = StateProvider<Trip>(
    (ref) => Trip(carName: "", dist: 0, from: "from", to: "to", spendFuel: 0));

final deletedTripsProvider = StateProvider<int>((ref) => 0);

final isEditCarProvider = StateProvider<bool>((ref) => false);

final navigationBarProvider = StateProvider<int>((ref) => 0);

final syncCurrenDBProvider = StateProvider<String?>((ref) => null);

final updateProfileProvider = StateProvider<int>((ref) => 0);

final updateDatabaseRouterProvider = StateProvider<int>(
  (ref) => 0,
);

final currentImageProvider = StateProvider<File>(
  (ref) => File(""),
);

final aboutPageCurrenView = StateProvider<int>((ref) => 0);
