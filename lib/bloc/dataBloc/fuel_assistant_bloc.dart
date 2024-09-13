import 'package:yakit_asistan/bloc/dataBloc/bloc.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/repository/fuel_assistant_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FuelAssistantBloc extends Bloc<FuelAssistantEvent, FuelAssistantState> {
  final FuelAssistantRepository fuelAssistantRepo =
      locator<FuelAssistantRepository>();
  FuelAssistantBloc() : super(InitialState()) {
    on<StartDatabaseEvent>((event, emit) async {
      emit(LoadingDataState());
      var carList = await fuelAssistantRepo.getCarList();
      var tripList = await fuelAssistantRepo.getTripList();
      emit(GetDataState(cars: carList, trips: tripList));
    });

    on<RefreshDatabaseEvent>(
      (event, emit) async {
        emit(LoadingDataState());
        var carList = await fuelAssistantRepo.getCarList();
        var tripList = await fuelAssistantRepo.getTripList();
        emit(GetDataState(cars: carList, trips: tripList));
      },
    );

    on<UpdateTripsEvent>((event, emit) async {
      emit(LoadingDataState());
      await fuelAssistantRepo.updateTrips(event.trips);
      emit(GetDataState(
          cars: await fuelAssistantRepo.getCarList(),
          trips: await fuelAssistantRepo.getTripList()));
    });

    on<UpdateCarsEvent>((event, emit) async {
      emit(LoadingDataState());
      await fuelAssistantRepo.updateCars(event.cars);
      emit(GetDataState(
          cars: await fuelAssistantRepo.getCarList(),
          trips: await fuelAssistantRepo.getTripList()));
    });

    on<AddCarEvent>((event, emit) async {
      emit(LoadingDataState());
      await fuelAssistantRepo.addCarToDatabase(event.car);
      emit(GetDataState(
          cars: await fuelAssistantRepo.getCarList(),
          trips: await fuelAssistantRepo.getTripList()));
    });

    on<AddTripEvent>((event, emit) async {
      emit(LoadingDataState());
      await fuelAssistantRepo.addTripToDatabase(event.trip);
      emit(GetDataState(
          cars: await fuelAssistantRepo.getCarList(),
          trips: await fuelAssistantRepo.getTripList()));
    });

    on<AddTripToCarEvent>((event, emit) async {
      emit(LoadingDataState());
      await fuelAssistantRepo.addTripToCar(event.trip);
      emit(GetDataState(
          cars: await fuelAssistantRepo.getCarList(),
          trips: await fuelAssistantRepo.getTripList()));
    });

    on<EditCarEvent>((event, emit) async {
      emit(LoadingDataState());
      await fuelAssistantRepo.editCar(event.lastCar, event.newCar);
      emit(GetDataState(
          cars: await fuelAssistantRepo.getCarList(),
          trips: await fuelAssistantRepo.getTripList()));
    });

    on<DeleteTripEvent>((event, emit) async {
      emit(LoadingDataState());
      await fuelAssistantRepo.deleteTrip(event.trip, event.tripId);
      emit(GetDataState(
          cars: await fuelAssistantRepo.getCarList(),
          trips: await fuelAssistantRepo.getTripList()));
    });

    on<DeleteCarEvent>((event, emit) async {
      emit(LoadingDataState());
      await fuelAssistantRepo.deleteCar(event.currentCar);
      emit(GetDataState(
          cars: await fuelAssistantRepo.getCarList(),
          trips: await fuelAssistantRepo.getTripList()));
    });
  }
}
