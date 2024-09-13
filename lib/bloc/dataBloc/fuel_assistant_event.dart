import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/models/trip.dart';

abstract class FuelAssistantEvent {}

class StartDatabaseEvent extends FuelAssistantEvent {}

class RefreshDatabaseEvent extends FuelAssistantEvent {}

class UpdateTripsEvent extends FuelAssistantEvent {
  List<Trip> trips;
  UpdateTripsEvent({required this.trips});
}

class UpdateCarsEvent extends FuelAssistantEvent {
  List<Car> cars;
  UpdateCarsEvent({required this.cars});
}

class AddCarEvent extends FuelAssistantEvent {
  final Car car;
  AddCarEvent({required this.car});
}

class AddTripEvent extends FuelAssistantEvent {
  final Trip trip;
  AddTripEvent({required this.trip});
}

class AddTripToCarEvent extends FuelAssistantEvent {
  final Trip trip;
  AddTripToCarEvent({required this.trip});
}

class EditCarEvent extends FuelAssistantEvent {
  final Car lastCar;
  final Car newCar;
  EditCarEvent({required this.lastCar, required this.newCar});
}

class DeleteCarEvent extends FuelAssistantEvent {
  final Car currentCar;
  DeleteCarEvent({required this.currentCar});
}

class DeleteTripEvent extends FuelAssistantEvent {
  final Trip trip;
  final int tripId;
  DeleteTripEvent({required this.trip, required this.tripId});
}
