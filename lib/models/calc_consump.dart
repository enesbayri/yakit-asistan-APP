import 'package:yakit_asistan/tools/text_controller_helper.dart';

class CalcConsump {
  int fuel;
  int dist;
  CalcConsump({
    required this.fuel,
    required this.dist,
  });
  double getConsumpWithCost() {
    double fuelCost =
        double.parse(TextControllerHelper.fuelCostController.text);
    double result = 100 / (dist / (fuel / fuelCost));
    return result;
  }

  double getConsump() {
    double result = 100 / (dist / fuel);
    return result;
  }
}
