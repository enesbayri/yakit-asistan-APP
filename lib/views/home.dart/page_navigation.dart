import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_event.dart';
import 'package:yakit_asistan/bloc/fuelCostBloc/cost_bloc.dart';
import 'package:yakit_asistan/bloc/fuelCostBloc/cost_event.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/router/page_content_router.dart';
import 'package:yakit_asistan/services/addmob_service.dart';
import 'package:yakit_asistan/views/commonwidgets/appmenu.dart';
import 'package:yakit_asistan/views/commonwidgets/bottom_navigation.dart';
import 'package:yakit_asistan/views/commonwidgets/floating_car_button.dart';
import 'package:yakit_asistan/views/commonwidgets/floating_trip_button.dart';
import 'package:yakit_asistan/views/commonwidgets/menu_animation.dart';
import 'package:yakit_asistan/views/commonwidgets/page_scaffold_builder.dart';

class PageNavigation extends ConsumerStatefulWidget {
  const PageNavigation({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageNavigationState();
}

class _PageNavigationState extends ConsumerState<PageNavigation> {
  late BannerAd _ad;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _ad = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('Banner Ad Loaded');
          setState(() {
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Banner Ad Failed to Load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );
    _ad.load();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<FuelAssistantBloc>().add(RefreshDatabaseEvent());
    context.read<FuelCostBloc>().add(GetRequestFuelCostEvent());
  }

  @override
  Widget build(BuildContext context) {
    int pageNavIndex = ref.watch(navigationBarProvider);
    return PageScaffoldBuilder(
        content: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: checkForAd(),
          ),
          // ignore: prefer_const_constructors
          AppMenu(),
          PageMenuAnimation(
            content: (PageContentRouter.navigationPages[pageNavIndex]),
          )
        ]),
        floatingActionButton: ((pageNavIndex == 0)
            ? const FloatingActionButtonTripsPage()
            : ((pageNavIndex == 3)
                ? const FloatingActionButtonCarsPage()
                : null)),
        bottomNavigation: const BottomNavigation());
  }

  Widget checkForAd() {
    if (isLoaded == true) {
      return Container(
        height: _ad.size.height.toDouble(),
        alignment: Alignment.topCenter,
        child: AdWidget(
          ad: _ad,
        ),
      );
    } else {
      return  const SizedBox.shrink();
    }
  }
}
