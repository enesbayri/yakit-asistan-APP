import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_state.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/profilepage/car_list_title.dart';
import 'package:yakit_asistan/views/profilepage/info_card.dart';

class ProfilePageCarList extends StatelessWidget {
  ProfilePageCarList({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CarListTitle(),
        SizedBox(
          width: screen.width * 0.8,
          height: 100,
          child: BlocBuilder<FuelAssistantBloc, FuelAssistantState>(
            builder: (context, state) => state.cars.isEmpty
                ? ProfileCarInfoCard(
                    carName: "Kayıtlı Araç Yok!",
                    imgUrl: "assets/cars/car3.jpg",
                  )
                : ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    children: state.cars
                        .map((car) => ProfileCarInfoCard(
                              carName: car.name,
                              imgUrl: car.imageUrl,
                            ))
                        .toList(),
                  ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
