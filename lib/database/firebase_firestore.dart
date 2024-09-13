import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:yakit_asistan/database/database.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/models/trip.dart';
import 'package:yakit_asistan/repository/cloudstore_repo.dart';

class FirestoreDatabase extends Database {
  FirebaseFirestore? firestore;

  FirestoreDatabase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> addCarStorage(String userId, Car car) async {
    CollectionReference carRef = firestore!.collection("cars");

    //car image add to firebase cloudstore
    String imgUrl = await locator<CloudstoreRepository>()
        .addImgToCloudStore(userId, car.name, File(car.imageUrl));
    car.imageUrl = imgUrl;

    var carSnapshot = await carRef
        .where("userId", isEqualTo: userId)
        .where("carCount", isLessThan: 10)
        .get();
    if (carSnapshot.docs.isEmpty) {
      await carRef.add({
        "userId": userId,
        "cars": FieldValue.arrayUnion([car.toMap()]),
        "carCount": 1,
      });
    } else {
      var doc = carSnapshot.docs[0];
      await doc.reference.update({
        "cars": FieldValue.arrayUnion([car.toMap()]),
        "carCount": FieldValue.increment(1)
      });
    }
  }

  Future<void> addTripStorage(String userId, Trip trip) async {
    CollectionReference tripsRef = firestore!.collection("trips");
    var tripSnapshot = await tripsRef
        .where("userId", isEqualTo: userId)
        .where("tripCount", isLessThan: 50)
        .get();
    if (tripSnapshot.docs.isEmpty) {
      await tripsRef.add({
        "userId": userId,
        "trips": FieldValue.arrayUnion([trip.toMap()]),
        "tripCount": 1
      });
    } else {
      var doc = tripSnapshot.docs[0];
      await doc.reference.update({
        "trips": FieldValue.arrayUnion([trip.toMap()]),
        "tripCount": FieldValue.increment(1)
      });
    }
  }

  Future<List<Car>> getCarsFromStorage(String userId) async {
    CollectionReference carsRef = firestore!.collection("cars");
    var carSnapshot = await carsRef.where("userId", isEqualTo: userId).get();
    List<Car> cars = [];
    if (carSnapshot.docs.isNotEmpty) {
      for (var doc in carSnapshot.docs) {
        var carData = doc.data() as Map<String, dynamic>;
        var carList = carData["cars"] as List;
        for (var encodeCar in carList) {
          Car car = Car.fromMap(encodeCar);
          cars.add(car);
        }
      }
    }
    return cars;
  }

  Future<List<Trip>> getTripsFromStorage(String userId) async {
    CollectionReference tripsRef = firestore!.collection("trips");
    var tripSnapshot = await tripsRef.where("userId", isEqualTo: userId).get();
    List<Trip> trips = [];
    if (tripSnapshot.docs.isNotEmpty) {
      for (var doc in tripSnapshot.docs) {
        var tripDocData = doc.data() as Map<String, dynamic>;
        for (var encodeTrip in tripDocData["trips"]) {
          trips.add(Trip.fromMap(encodeTrip));
        }
      }
    }
    return trips;
  }

  Future<void> updateCarStorage(List cars, QueryDocumentSnapshot doc) async {
    await doc.reference.update({"cars": cars, "carCount": cars.length});
  }

  Future<void> updateTripStorage(List trips, QueryDocumentSnapshot doc) async {
    await doc.reference.update({"trips": trips, "tripCount": trips.length});
  }

  Future<void> addTripToCar(String userId, Trip trip) async {
    CollectionReference carsRef = firestore!.collection("cars");
    var carSnapshot = await carsRef.where("userId", isEqualTo: userId).get();
    if (carSnapshot.docs.isNotEmpty) {
      for (var doc in carSnapshot.docs) {
        var carData = doc.data() as Map<String, dynamic>;
        var carList = List.from(carData["cars"] as List);
        carList.retainWhere((item) => item["name"] == trip.carName);
        if (carList.isNotEmpty) {
          carList = List.from(carData["cars"] as List);
          carList = carList.map((e) {
            if (e["name"] == trip.carName) {
              Car car = Car.fromMap(e);
              car.addTrip(trip);
              return car.toMap();
            } else {
              return e;
            }
          }).toList();
          await updateCarStorage(carList, doc);
          break;
        }
      }
    }
  }

  Future<void> editCar(String userId, Car lastCar, Car newCar) async {
    CollectionReference carsRef = firestore!.collection("cars");
    var carSnapshot = await carsRef.where("userId", isEqualTo: userId).get();
    if (carSnapshot.docs.isNotEmpty) {
      for (var doc in carSnapshot.docs) {
        var carData = doc.data() as Map<String, dynamic>;
        var carList = List.from(carData["cars"] as List);
        carList.retainWhere((item) => item["name"] == lastCar.name);
        if (carList.isNotEmpty) {
          carList = carData["cars"] as List;
          carList = carList.map((e) {
            if (e["name"] == lastCar.name) {
              return newCar.toMap();
            } else {
              return e;
            }
          }).toList();
          await updateCarStorage(carList, doc);
          break;
        }
      }
    }
    if (lastCar.name != newCar.name) {
      CollectionReference tripsRef = firestore!.collection("trips");
      var tripSnapshot =
          await tripsRef.where("userId", isEqualTo: userId).get();
      if (tripSnapshot.docs.isNotEmpty) {
        for (var doc in tripSnapshot.docs) {
          var tripData = doc.data() as Map<String, dynamic>;
          var trips = List.from(tripData["trips"] as List);
          trips.retainWhere((item) => item["carName"] == lastCar.name);
          if (trips.isNotEmpty) {
            var newTrips = List.from(tripData["trips"] as List);
            newTrips.map((e) {
              if (e["carName"] == lastCar.name) {
                e["carName"] = newCar.name;
              }
              return e;
            }).toList();
            await doc.reference.update({"trips": newTrips});
          }
        }
      }
    }
  }

  Future<void> deleteCar(String userId, Car car) async {
    CollectionReference carRef = firestore!.collection("cars");
    var carSnapshot = await carRef.where("userId", isEqualTo: userId).get();
    if (carSnapshot.docs.isNotEmpty) {
      for (var doc in carSnapshot.docs) {
        var encodedData = doc.data() as Map<String, dynamic>;
        var carList = encodedData["cars"] as List;
        var carListLenght = carList.length;
        carList.removeWhere((e) => e["id"] == car.id);
        if (carListLenght != carList.length) {
          await locator<CloudstoreRepository>()
              .deleteCarImageToCloudstore(userId, car.name);
          await doc.reference
              .update({"cars": carList, "carCount": FieldValue.increment(-1)});
          break;
        }
      }
    }
  }

  Future<void> deleteTrip(String userId, Trip trip) async {
    CollectionReference tripRef = firestore!.collection("trips");
    var tripSnapshot = await tripRef.where("userId", isEqualTo: userId).get();
    if (tripSnapshot.docs.isNotEmpty) {
      for (var doc in tripSnapshot.docs) {
        var encodedTrip = doc.data() as Map<String, dynamic>;
        var tripList = encodedTrip["trips"] as List;
        var tripLenght = tripList.length;
        tripList.removeWhere((e) {
          return e["id"] == trip.id;
        });
        debugPrint(trip.id);
        if (tripLenght != tripList.length) {
          await doc.reference.update(
              {"trips": tripList, "tripCount": FieldValue.increment(-1)});

          CollectionReference carsRef = firestore!.collection("cars");
          var carSnapshot =
              await carsRef.where("userId", isEqualTo: userId).get();
          if (carSnapshot.docs.isNotEmpty) {
            for (var doc in carSnapshot.docs) {
              var carData = doc.data() as Map<String, dynamic>;
              var carList = List.from(carData["cars"] as List);
              carList.retainWhere((item) => item["name"] == trip.carName);
              if (carList.isNotEmpty) {
                carList = carData["cars"] as List;
                carList = carList.map((e) {
                  if (e["name"] == trip.carName) {
                    Car car = Car.fromMap(e);
                    car.deleteTrip(trip);
                    return car.toMap();
                  } else {
                    return e;
                  }
                }).toList();
                await updateCarStorage(carList, doc);
                break;
              }
            }
          }
          break;
        }
      }
    }
  }

  Future<void> syncTripsToFirestore(String userId, List<Trip> trips) async {
    CollectionReference tripsRef = firestore!.collection("trips");
    var tripSnapshot = await tripsRef
        .where("userId", isEqualTo: userId)
        .where("tripCount", isLessThan: 50)
        .get();
    if (tripSnapshot.docs.isEmpty) {
      if (trips.length <= 50) {
        await tripsRef.add({
          "userId": userId,
          "trips": FieldValue.arrayUnion(trips.map((e) => e.toMap()).toList()),
          "tripCount": trips.length
        });
      } else {
        int docCount = trips.length ~/ 50;
        for (var i = 0; i < docCount; i++) {
          var newList = trips.sublist(i * 50, (i + 1) * 50);
          await tripsRef.add({
            "userId": userId,
            "trips":
                FieldValue.arrayUnion(newList.map((e) => e.toMap()).toList()),
            "tripCount": newList.length
          });
        }
      }
    } else {
      if (trips.length <= 50) {
        var tripData = tripSnapshot.docs[0].data() as Map<String, dynamic>;
        var tripCount = tripData["tripCount"] as int;
        if (tripCount + trips.length <= 50) {
          await tripSnapshot.docs[0].reference.update({
            "trips":
                FieldValue.arrayUnion(trips.map((e) => e.toMap()).toList()),
            "tripCount": FieldValue.increment(trips.length)
          });
        } else {
          var newList = trips.sublist(0, 50 - tripCount);
          var remainList = trips.sublist(50 - tripCount, trips.length);
          await tripSnapshot.docs[0].reference.update({
            "trips":
                FieldValue.arrayUnion(newList.map((e) => e.toMap()).toList()),
            "tripCount": FieldValue.increment(newList.length)
          });
          await tripsRef.add({
            "userId": userId,
            "trips": FieldValue.arrayUnion(
                remainList.map((e) => e.toMap()).toList()),
            "tripCount": remainList.length
          });
        }
      } else {
        int docCount = trips.length ~/ 50;
        for (var i = 0; i < docCount; i++) {
          var newList = trips.sublist(i * 50, (i + 1) * 50);
          await tripsRef.add({
            "userId": userId,
            "trips":
                FieldValue.arrayUnion(newList.map((e) => e.toMap()).toList()),
            "tripCount": newList.length
          });
        }
      }
    }
  }

  Future<void> syncCarsToFirestore(String userId, List<Car> carList) async {
    List<Car> carsFilter = await getCarsFromStorage(userId);
    List<Car> cars = [];
    for (var car in carList) {
      if (!(carsFilter.any((element) => element.name == car.name))) {
        cars.add(car);
      }
    }
    CollectionReference carsRef = firestore!.collection("cars");
    var carSnapshot = await carsRef
        .where("userId", isEqualTo: userId)
        .where("carCount", isLessThan: 10)
        .get();
    var cloudstore = locator<CloudstoreRepository>();
    if (carSnapshot.docs.isEmpty) {
      if (cars.length <= 10) {
        for (var i = 0; i < cars.length; i++) {
          cars[i].imageUrl = await cloudstore.addImgToCloudStore(
              userId, cars[i].name, File(cars[i].imageUrl));
        }
        await carsRef.add({
          "userId": userId,
          "cars": FieldValue.arrayUnion(cars.map((e) => e.toMap()).toList()),
          "carCount": cars.length
        });
      } else {
        int docCount = cars.length ~/ 10;
        for (var i = 0; i < docCount; i++) {
          var newList = cars.sublist(i * 10, (i + 1) * 10);
          for (var i = 0; i < newList.length; i++) {
            newList[i].imageUrl = await cloudstore.addImgToCloudStore(
                userId, newList[i].name, File(newList[i].imageUrl));
          }
          await carsRef.add({
            "userId": userId,
            "cars":
                FieldValue.arrayUnion(newList.map((e) => e.toMap()).toList()),
            "carCount": newList.length
          });
        }
      }
    } else {
      if (cars.length <= 10) {
        var carData = carSnapshot.docs[0].data() as Map<String, dynamic>;
        var carCount = carData["carCount"] as int;
        if (carCount + cars.length <= 10) {
          for (var i = 0; i < cars.length; i++) {
            cars[i].imageUrl = await cloudstore.addImgToCloudStore(
                userId, cars[i].name, File(cars[i].imageUrl));
          }
          debugPrint(cars.toString());
          await carSnapshot.docs[0].reference.update({
            "cars": FieldValue.arrayUnion(cars.map((e) => e.toMap()).toList()),
            "carCount": FieldValue.increment(cars.length)
          });
        } else {
          var newList = cars.sublist(0, 10 - carCount);
          var remainList = cars.sublist(10 - carCount, cars.length);
          for (var i = 0; i < newList.length; i++) {
            newList[i].imageUrl = await cloudstore.addImgToCloudStore(
                userId, newList[i].name, File(newList[i].imageUrl));
          }
          for (var i = 0; i < remainList.length; i++) {
            remainList[i].imageUrl = await cloudstore.addImgToCloudStore(
                userId, remainList[i].name, File(remainList[i].imageUrl));
          }
          await carSnapshot.docs[0].reference.update({
            "cars":
                FieldValue.arrayUnion(newList.map((e) => e.toMap()).toList()),
            "carCount": FieldValue.increment(newList.length)
          });
          await carsRef.add({
            "userId": userId,
            "cars": FieldValue.arrayUnion(
                remainList.map((e) => e.toMap()).toList()),
            "carCount": remainList.length
          });
        }
      } else {
        int docCount = cars.length ~/ 10;
        for (var i = 0; i < docCount; i++) {
          var newList = cars.sublist(i * 10, (i + 1) * 10);
          for (var i = 0; i < newList.length; i++) {
            newList[i].imageUrl = await cloudstore.addImgToCloudStore(
                userId, newList[i].name, File(newList[i].imageUrl));
          }
          await carsRef.add({
            "userId": userId,
            "cars":
                FieldValue.arrayUnion(newList.map((e) => e.toMap()).toList()),
            "carCount": newList.length
          });
        }
      }
    }
  }
}
