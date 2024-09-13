import 'package:yakit_asistan/database/firebase_firestore.dart';
import 'package:yakit_asistan/database/hive_database.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/models/trip.dart';
import 'package:yakit_asistan/services/auth_service.dart';

class SyncRepository {
  final HiveDatabase hiveDatabase = locator<HiveDatabase>();
  final FirestoreDatabase firestoreDatabase = locator<FirestoreDatabase>();
  final AuthService auth = locator<AuthService>();

  Future<void> syncCarsToLocalDB() async {
    try {
      String? userId = auth.getUserId();
      if (userId != null) {
        List<Car> cars = await firestoreDatabase.getCarsFromStorage(userId);
        await hiveDatabase.syncCarsToLocalDB(cars);
      } else {
        throw "User Not Login";
      }
    } catch (e) {
      throw "User Not Login";
    }
  }

  Future<void> syncTripsToLocalDB() async {
    try {
      String? userId = auth.getUserId();
      if (userId != null) {
        List<Trip> trips = await firestoreDatabase.getTripsFromStorage(userId);
        await hiveDatabase.syncTripsToLocalDB(trips);
      } else {
        throw "User Not Login";
      }
    } catch (e) {
      throw "User Not Login";
    }
  }

  Future<void> syncCarsToServer() async {
    String? userId = auth.getUserId();
    if (userId != null) {
      List<Car> cars = hiveDatabase.getCarsfromStorage();
      await firestoreDatabase.syncCarsToFirestore(userId, cars);
    }
  }

  Future<void> syncTripsToServer() async {
    String? userId = auth.getUserId();
    if (userId != null) {
      List<Trip> trips = hiveDatabase.getTripsfromStorage();
      await firestoreDatabase.syncTripsToFirestore(userId, trips);
    }
  }
}
