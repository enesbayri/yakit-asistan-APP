//*** Veritabanı seyahatlerime eriş ve seyahati sil - Veritabanı araca ulaş ve araçtan tribi sil
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_bloc.dart';
import 'package:yakit_asistan/bloc/dataBloc/fuel_assistant_event.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/trip.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/alert_dialog_delete.dart';
import 'package:yakit_asistan/views/tripspage/car_name_box.dart';
import 'package:yakit_asistan/views/tripspage/trip_card_content.dart';

class TripCard extends ConsumerStatefulWidget {
  const TripCard({
    super.key,
    required this.carName,
    required this.from,
    required this.to,
    required this.dist,
    required this.consump,
    required this.spendFuel,
    required this.tripId,
    required this.trip,
  });

  final String carName;
  final String from;
  final String to;
  final int dist;
  final double consump;
  final int spendFuel;
  final int tripId;
  final Trip trip;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TripCardState();
}

class _TripCardState extends ConsumerState<TripCard>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late SequenceAnimation animation;
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    controller = AnimationController(vsync: this);
    animation = SequenceAnimationBuilder()
        .addAnimatable(
            curve: Curves.linear,
            animatable: Tween<double>(begin: 0, end: screen.width),
            from: Duration.zero,
            to: const Duration(milliseconds: 500),
            tag: "swipe")
        .addAnimatable(
            curve: Curves.linear,
            animatable: Tween<double>(begin: 1, end: 0),
            from: Duration.zero,
            to: const Duration(milliseconds: 500),
            tag: "scale")
        .animate(controller);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(animation["swipe"].value * -1, 0),
        child: Transform.scale(
          scale: animation["scale"].value,
          child: Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: ColorUiHelper.carsSortColor,
                offset: Offset(animation["swipe"].value * 1, 0),
                blurRadius: animation["swipe"].value * 0.1,
                spreadRadius: 0,
              )
            ]),
            child: Stack(
              children: [
                Container(
                  width: screen.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: ColorUiHelper.appMainColor,
                    //borderRadius: BorderRadius.circular(32),
                    //border: Border.all(width: 1, color: ColorUiHelper.calcutesBoxBorderColor),
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: ColorUiHelper.calcutesBoxBorderColor),
                        top: BorderSide(
                            width: 1,
                            color: ColorUiHelper.calcutesBoxBorderColor)),
                    image: const DecorationImage(
                        image: AssetImage("assets/icons/mainIcon.png"),
                        opacity: 0.1,
                        alignment: Alignment.centerRight),
                    boxShadow: [
                      BoxShadow(
                          color: ColorUiHelper.appMainColor.withOpacity(1),
                          spreadRadius: 0.1,
                          blurRadius: 5,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                  child: TripCardContent(
                      from: widget.from,
                      dist: widget.dist,
                      to: widget.to,
                      consump: widget.consump,
                      spendFuel: widget.spendFuel),
                ),
                TripCardCarNameBox(carName: widget.carName),
                Positioned(
                    right: -10,
                    top: -10,
                    child: IconButton(
                        onPressed: () async {
                          AlertDialogForDelete.showDeleteAlertDialog(
                            context: context,
                            title: "Seyahat silinsin mi?",
                            content: const Text(
                                "Eğer bu seyahatinizi silerseniz, bu seyahatinizi gerçekleştirdiğiniz aracınızdan ortalama tüketiminiz ve seyahat mesafeniz çıkarılacaktır!"),
                            onBackPressed: () {
                              Navigator.of(context).pop();
                            },
                            onDeletePressed: () async {
                              Navigator.of(context).pop();
                              context.read<FuelAssistantBloc>().add(
                                  DeleteTripEvent(
                                      trip: widget.trip,
                                      tripId: widget.tripId));
                              await controller.forward();
                              ref.read(deletedTripsProvider.notifier).state +=
                                  1;
                            },
                          );
                        },
                        icon: Icon(
                          Icons.delete_forever,
                          size: 36,
                          color: ColorUiHelper.carsSortColor,
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
