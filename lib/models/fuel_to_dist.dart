class FuelToDist {
  int fuel;
  int consump;
  FuelToDist({
    required this.fuel,
    required this.consump,
  });

  double getDist() {
    double result = ((100 / consump) * fuel);
    return result;
  }
}
