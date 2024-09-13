import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yakit_asistan/views/fuelcostspage/state_router.dart';

import '../../bloc/fuelCostBloc/cost_bloc.dart';
import '../../bloc/fuelCostBloc/cost_state.dart';

class FuelCostPageContent extends StatelessWidget {
  const FuelCostPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FuelCostBloc, FuelCostState>(
      builder: (context, state) {
        if (state is LoadingFuelCostsState) {
          debugPrint("loadinggggggggggg");
          return FuelCostsStateRouter(
            isLoading: true,
          );
        } else if (state is ErrorLoadFuelCostsState) {
          debugPrint("errorrrrrrrrrrrr");
          return FuelCostsStateRouter(
            isLoading: false,
          );
        } else if (state is CompletedFuelCostsState) {
          debugPrint("complateddddddddddddd");
          return FuelCostsStateRouter(
            costs: state.costs,
            isLoading: false,
          );
        } else {
          debugPrint("initiallllllllllll");
          return FuelCostsStateRouter(
            isLoading: false,
          );
        }
      },
    );
  }
}
