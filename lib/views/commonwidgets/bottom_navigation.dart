import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/bloc/fuelCostBloc/cost_bloc.dart';
import 'package:yakit_asistan/bloc/fuelCostBloc/cost_event.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/bottom_bar_helper.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({
    super.key,
    this.isCalcPage,
  });

  final bool? isCalcPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int navIndex = ref.watch(navigationBarProvider);
    return StyleProvider(
      key: UniqueKey(),
      style: BottomBarStyleHelper(),
      child: ConvexAppBar(
          style: TabStyle.flip,
          shadowColor: ColorUiHelper.calcutesdisabledScrollColor,
          height: 40,
          backgroundColor: ColorUiHelper.appBgColor,
          color: ColorUiHelper.appMainColor,
          activeColor: ColorUiHelper.appSecondColor,
          items: const [
            TabItem(icon: Icons.route_outlined, title: "Seyahatlerim"),
            TabItem(icon: Icons.local_gas_station_rounded, title: "Fiyatlar"),
            TabItem(icon: Icons.calculate, title: "Hesaplamalar"),
            TabItem(icon: Icons.commute_sharp, title: "Araçlarım"),
          ],
          initialActiveIndex: navIndex,
          onTap: (int i) {
            if (isCalcPage != null && isCalcPage == true) {
              Navigator.of(context).pop();
            }
            if (i == 1) {
              context.read<FuelCostBloc>().add(GetRequestFuelCostEvent());
            }
            ref.read(navigationBarProvider.notifier).state = i;
            //Navigator.of(context).pushNamed("MyCarsPage");
          }),
    );
  }
}
