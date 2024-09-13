import 'package:yakit_asistan/tools/text_controller_helper.dart';

class DistToCost {
  int dist;
  int consump;
  DistToCost({
    required this.dist,
    required this.consump,
  });

  double getCost() {
    double cost = 1;
    String input = TextControllerHelper.distPagefuelCostController.text;
    if (input != "") {
      cost = double.parse(input);
    }
    double result = (dist * (consump / 100)) * (cost);
    return result;
  }
}
