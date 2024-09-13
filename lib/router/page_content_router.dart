import 'package:flutter/cupertino.dart';
import 'package:yakit_asistan/views/calculatepages/calculatespage/calculates_page.dart';
import 'package:yakit_asistan/views/carspage/cars_page.dart';
import 'package:yakit_asistan/views/fuelcostspage/fuel_costs_page.dart';
import 'package:yakit_asistan/views/tripspage/trips_page.dart';

class PageContentRouter {
  static List<Widget> navigationPages = const [
    MyTripsPage(),
    FuelCostPage(),
    CalcutesPage(),
    MyCarsPage(),
  ];
}
