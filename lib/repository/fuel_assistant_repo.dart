import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yakit_asistan/database/firebase_firestore.dart';
import 'package:yakit_asistan/database/hive_database.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/models/trip.dart';
import 'package:yakit_asistan/repository/database_router_repo.dart';
import 'package:yakit_asistan/services/auth_service.dart';

class FuelAssistantRepository {
  final HiveDatabase hiveDatabase = locator<HiveDatabase>();
  final FirestoreDatabase firestoreDatabase = locator<FirestoreDatabase>();
  final AuthService auth = locator<AuthService>();
  final connection = locator<InternetConnectionChecker>();
  final dbRoute = locator<DatabaseRouterRepository>();

  Future<List<Trip>> getTripList() async {
    bool hasConnection = await connection.hasConnection;
    if (dbRoute.isLocalDbRouter()) {
      return hiveDatabase.getTripsfromStorage().reversed.toList();
    } else if (!(hasConnection)) {
      return hiveDatabase.getTripsfromStorage().reversed.toList();
    } else {
      //if user online
      String? userId = auth.getUserId();
      if (userId != null) {
        return (await firestoreDatabase.getTripsFromStorage(userId)).reversed.toList();
      } else {
        return [];
      }
    }
  }

  Future<List<Car>> getCarList() async {
    bool hasConnection = await connection.hasConnection;
    if (dbRoute.isLocalDbRouter()) {
      return hiveDatabase.getCarsfromStorage();
    } else if (!(hasConnection)) {
      return hiveDatabase.getCarsfromStorage();
    } else {
      //if user online
      String? userId = auth.getUserId();
      if (userId != null) {
        return await firestoreDatabase.getCarsFromStorage(userId);
      } else {
        return [];
      }
    }
  }

  Future<void> updateTrips(List<Trip> trips) async {
    await hiveDatabase.updateTripStorage(trips);
  }

  Future<void> updateCars(List<Car> cars) async {
    await hiveDatabase.updateCarStorage(cars);
  }

  Future<void> addTripToDatabase(Trip trip) async {
    bool hasConnection = await connection.hasConnection;
    if (dbRoute.isLocalDbRouter()) {
      await hiveDatabase.addTripStorage(trip);
    } else if (!(hasConnection)) {
      await hiveDatabase.addTripStorage(trip);
    } else {
      //if user online
      String? userId = auth.getUserId();
      if (userId != null) {
        await firestoreDatabase.addTripStorage(userId, trip);
      }
    }
  }

  Future<void> addCarToDatabase(Car car) async {
    bool hasConnection = await connection.hasConnection;
    if (dbRoute.isLocalDbRouter()) {
      await hiveDatabase.addCarStorage(car);
    } else if (!(hasConnection)) {
      await hiveDatabase.addCarStorage(car);
    } else {
      //if user online
      String? userId = auth.getUserId();
      if (userId != null) {
        await firestoreDatabase.addCarStorage(userId, car);
      }
    }
  }

  Future<void> addTripToCar(Trip trip) async {
    bool hasConnection = await connection.hasConnection;
    if (dbRoute.isLocalDbRouter()) {
      await hiveDatabase.addTripToCar(trip);
    } else if (!(hasConnection)) {
      await hiveDatabase.addTripToCar(trip);
    } else {
      //if user online
      String? userId = auth.getUserId();
      if (userId != null) {
        await firestoreDatabase.addTripToCar(userId, trip);
      }
    }
  }

  Future<void> editCar(Car lastCar, Car newCar) async {
    bool hasConnection = await connection.hasConnection;
    if (dbRoute.isLocalDbRouter()) {
      await hiveDatabase.editCar(lastCar, newCar);
    } else if (!(hasConnection)) {
      await hiveDatabase.editCar(lastCar, newCar);
    } else {
      //if user online
      String? userId = auth.getUserId();
      if (userId != null) {
        await firestoreDatabase.editCar(userId, lastCar, newCar);
      }
    }
  }

  Future<void> deleteCar(Car currentCar) async {
    try {
      bool hasConnection = await connection.hasConnection;
      if (dbRoute.isLocalDbRouter()) {
        await hiveDatabase.deleteCar(currentCar);
      } else if (!(hasConnection)) {
        await hiveDatabase.deleteCar(currentCar);
      } else {
        //if user online
        String? userId = auth.getUserId();
        if (userId != null) {
          await firestoreDatabase.deleteCar(userId, currentCar);
        }
      }
    } catch (e) {
      throw e.toString();
    }
    
  }

  Future<void> deleteTrip(Trip trip, int tripId) async {
    try {
      bool hasConnection = await connection.hasConnection;
      if (dbRoute.isLocalDbRouter()) {
        await hiveDatabase.deleteTrip(trip.carName, tripId);
      } else if (!(hasConnection)) {
        await hiveDatabase.deleteTrip(trip.carName, tripId);
      } else {
        //if user online
        String? userId = auth.getUserId();
        if (userId != null) {
          await firestoreDatabase.deleteTrip(userId, trip);
        }
      }
    } catch (e) {
      throw "Bir hata oluştu!";
    }
    
  }
}
