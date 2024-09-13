class FuelCostState {}

class InitialCostState extends FuelCostState {}

class LoadingFuelCostsState extends FuelCostState {}

class CompletedFuelCostsState extends FuelCostState {
  Map<String, Map> costs;
  CompletedFuelCostsState({required this.costs});
}

class ErrorLoadFuelCostsState extends FuelCostState {}
