import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:yakit_asistan/models/fuel_calculates.dart';
import 'package:yakit_asistan/models/trip.dart';

class Car {
  String? id;
  String name;
  String imageUrl;
  int model;
  String type;
  String transmission;
  String fuel;
  int totalDist;
  double consump;

  static List<int> carModelYears = List.generate(124, (index) => 2024 - index);

  Car({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.model,
    required this.type,
    required this.transmission,
    required this.fuel,
    required this.totalDist,
    required this.consump,
  }) {
    id ??= const Uuid().v4();
  }

  static Car editCar(Car lastCar, Car newCar) {
    lastCar.name = newCar.name;
    return lastCar.copyWith();
  }

  static Car createNullCar() => Car(
      name: "",
      imageUrl: "",
      model: 0,
      type: "",
      transmission: "",
      fuel: "",
      totalDist: 0,
      consump: 0);

  static Car seachCarfromName(String name, List<Car> cars) {
    Car car = cars.firstWhere(
      (car) => car.name == name,
      orElse: () => Car.createNullCar(),
    );
    return car;
  }

  static bool alreadyNameValidator(String name, List<Car> cars) {
    Car car = Car.seachCarfromName(name, cars);
    if (car.name != "") {
      return false;
    }
    return true;
  }

  void addTrip(Trip trip) {
    consump = FuelCalculates.addConsumpToCar(trip, consump, totalDist);
    totalDist += trip.dist;
  }

  void deleteTrip(Trip trip) {
    consump = FuelCalculates.deleteConsumpToCar(trip, consump, totalDist);
    totalDist -= trip.dist;
  }

  @override
  String toString() {
    return 'Car(id: $id, name: $name, imageUrl: $imageUrl, model: $model, type: $type, transmission: $transmission, fuel: $fuel, totalDist: $totalDist, consump: $consump)';
  }

  Car copyWith({
    String? id,
    String? name,
    String? imageUrl,
    int? model,
    String? type,
    String? transmission,
    String? fuel,
    int? totalDist,
    double? consump,
  }) {
    return Car(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      model: model ?? this.model,
      type: type ?? this.type,
      transmission: transmission ?? this.transmission,
      fuel: fuel ?? this.fuel,
      totalDist: totalDist ?? this.totalDist,
      consump: consump ?? this.consump,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'model': model,
      'type': type,
      'transmission': transmission,
      'fuel': fuel,
      'totalDist': totalDist,
      'consump': consump,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map["id"] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      model: map['model'] as int,
      type: map['type'] as String,
      transmission: map['transmission'] as String,
      fuel: map['fuel'] as String,
      totalDist: map['totalDist'] as int,
      consump: map['consump'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) =>
      Car.fromMap(json.decode(source) as Map<String, dynamic>);
}
