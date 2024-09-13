import 'package:flutter/cupertino.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/views/addtrippage/page_content.dart';

class AddTripPage extends StatelessWidget {
  const AddTripPage({super.key, required this.cars});
  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return AddTripPageContent(
      cars: cars,
    );
  }
}
