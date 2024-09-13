import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yakit_asistan/bloc/fuelCostBloc/bloc.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/repository/fuel_costs_api_repo.dart';

class FuelCostBloc extends Bloc<FuelCostEvent, FuelCostState> {
  FuelCostBloc() : super(InitialCostState()) {
    FuelCostsApiRepository costRepo = locator<FuelCostsApiRepository>();
    on<GetRequestFuelCostEvent>((event, emit) async {
      emit(LoadingFuelCostsState());
      try {
        Map<String, Map> costs = await costRepo.getFuelCostsFromDB();
        emit(CompletedFuelCostsState(costs: costs));
      } catch (e) {
        emit(ErrorLoadFuelCostsState());
      }
    });
  }
}
