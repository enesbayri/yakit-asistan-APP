// ignore_for_file: overridden_fields

import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/models/trip.dart';

abstract class FuelAssistantState {
  List<Trip> trips = [];
  List<Car> cars = [];
}

class InitialState extends FuelAssistantState {}

class GetDataState extends FuelAssistantState {
  @override
  List<Trip> trips;
  @override
  List<Car> cars;
  GetDataState({required this.cars, required this.trips});
}

class LoadingDataState extends FuelAssistantState {}
