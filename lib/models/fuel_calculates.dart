import 'package:yakit_asistan/models/trip.dart';

class FuelCalculates {
  static distAndSpendFuelToConsump(dist, spendFuel) {
    return (spendFuel / dist) * 100;
  }

  static addConsumpToCar(Trip trip, double carConsump, totalDist) {
    double spendLFromKm = carConsump / 100;
    double totalSpendFuel = totalDist * spendLFromKm;
    totalSpendFuel += trip.spendFuel;
    totalDist += trip.dist;
    return distAndSpendFuelToConsump(totalDist, totalSpendFuel);
  }

  static deleteConsumpToCar(Trip trip, double carConsump, totalDist) {
    double spendLFromKm = carConsump / 100;
    double totalSpendFuel = totalDist * spendLFromKm;
    if (trip.spendFuel >= totalSpendFuel) {
      totalSpendFuel = 0; // Çok küçük küsürat hatası oluşmasını engelleme
      return 0.0;
    } else {
      totalSpendFuel -= trip.spendFuel;
    }
    totalDist -= trip.dist;
    return distAndSpendFuelToConsump(totalDist, totalSpendFuel);
  }
}
