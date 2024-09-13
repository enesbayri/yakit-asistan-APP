import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:yakit_asistan/models/fuel_calculates.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';

class Trip {
  String? id;
  String carName;
  double? carConsump = 0;
  int dist;
  String from;
  String to;
  int spendFuel;
  Trip(
      {this.id,
      required this.carName,
      required this.dist,
      required this.from,
      required this.to,
      required this.spendFuel,
      this.carConsump}) {
    carConsump = FuelCalculates.distAndSpendFuelToConsump(dist, spendFuel);
    id ??= const Uuid().v4();
  }

  static Trip? addTripContentFromTextController(Trip trip) {
    String from = TextControllerHelper.addTripPageFrom.text;
    String to = TextControllerHelper.addTripPageTo.text;
    String distText = TextControllerHelper.addTripPageDist.text;
    String spendFuelText = TextControllerHelper.addTripPageFuel.text;
    if (distText == "" ||
        distText == "0" ||
        from == "" ||
        to == "" ||
        spendFuelText == "" ||
        spendFuelText == "0" ||
        trip.carName == "") {
      return null;
    } else {
      int dist = int.parse(distText);
      int spendFuel = int.parse(spendFuelText);
      Trip createTrip = Trip(
          carName: trip.carName,
          dist: dist,
          from: from,
          to: to,
          spendFuel: spendFuel);
      TextControllerHelper.resetAddTripInputs();
      return createTrip;
    }
  }

  Trip copyWith({
    String? id,
    String? carName,
    double? carConsump,
    int? dist,
    String? from,
    String? to,
    int? spendFuel,
  }) {
    return Trip(
      carName: carName ?? this.carName,
      carConsump: carConsump ?? this.carConsump,
      dist: dist ?? this.dist,
      from: from ?? this.from,
      to: to ?? this.to,
      spendFuel: spendFuel ?? this.spendFuel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'carName': carName,
      'carConsump': carConsump,
      'dist': dist,
      'from': from,
      'to': to,
      'spendFuel': spendFuel,
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map) {
    return Trip(
      id: map["id"] as String,
      carName: map['carName'] as String,
      carConsump: map['carConsump'] != null ? map['carConsump'] as double : 0,
      dist: map['dist'] as int,
      from: map['from'] as String,
      to: map['to'] as String,
      spendFuel: map['spendFuel'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Trip.fromJson(String source) =>
      Trip.fromMap(json.decode(source) as Map<String, dynamic>);
}
