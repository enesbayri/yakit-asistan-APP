import 'package:flutter/cupertino.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class AnimationControll {
  static late AnimationController controller;
  static late SequenceAnimation sequenceAnimation;

  static late AnimationController loginController;
  static late SequenceAnimation loginSequenceAnimation;

  static late AnimationController syncController;
  static late SequenceAnimation syncSequenceAnimation;

  static late AnimationController profileController;
  static late SequenceAnimation profileSequenceAnimation;

  static void createAnimations(TickerProvider vsync, BuildContext context) {
    controller = AnimationController(vsync: vsync);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 0.6),
            from: Duration.zero,
            to: const Duration(milliseconds: 250),
            tag: "scalePage")
        .addAnimatable(
            animatable: Tween<double>(
                begin: 0, end: MediaQuery.of(context).size.width / 3.5),
            from: Duration.zero,
            to: const Duration(milliseconds: 250),
            tag: "translatePage")
        .addAnimatable(
            animatable: BorderRadiusTween(
                begin: BorderRadius.circular(0),
                end: BorderRadius.circular(36)),
            from: Duration.zero,
            to: const Duration(milliseconds: 250),
            tag: "borderRadiusPage")
        .addAnimatable(
            animatable: Tween<double>(begin: -200, end: 0),
            from: const Duration(milliseconds: 100),
            to: const Duration(milliseconds: 250),
            tag: "translateMenu")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 100),
            to: const Duration(milliseconds: 250),
            tag: "scaleMenu")
        .animate(controller);

    loginController = AnimationController(vsync: vsync);
    loginSequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 200),
            to: const Duration(milliseconds: 500),
            tag: "phoneScale")
        .addAnimatable(
            animatable: Tween<double>(begin: 1000, end: 0),
            from: Duration.zero,
            to: const Duration(milliseconds: 500),
            tag: "phonePosition")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 500),
            to: const Duration(milliseconds: 3000),
            curve: Curves.bounceInOut,
            tag: "titleOpacity")
        .animate(loginController);
  }

  static void createLoginPageAnimation() {
    loginSequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 200),
            to: const Duration(milliseconds: 500),
            tag: "phoneScale")
        .addAnimatable(
            animatable: Tween<double>(begin: 1000, end: 0),
            from: Duration.zero,
            to: const Duration(milliseconds: 500),
            tag: "phonePosition")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 500),
            to: const Duration(milliseconds: 3000),
            curve: Curves.bounceInOut,
            tag: "titleOpacity")
        .animate(loginController);
  }

  static void createSyncPageAnimation(
      TickerProvider vsync, BuildContext context) {
    syncController = AnimationController(vsync: vsync);

    syncSequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 1, end: 1.1),
            from: Duration.zero,
            to: const Duration(milliseconds: 1000),
            tag: "currentDBScale")
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 10),
            from: Duration.zero,
            to: const Duration(milliseconds: 1000),
            tag: "currentDBShadow")
        .animate(syncController);
  }

  static void createProfilePageAnimation(
      TickerProvider vsync, BuildContext context) {
    profileController = AnimationController(vsync: vsync);

    profileSequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 200),
            to: const Duration(milliseconds: 500),
            tag: "phoneScale")
        .addAnimatable(
            animatable: Tween<double>(begin: 1000, end: 0),
            from: Duration.zero,
            to: const Duration(milliseconds: 500),
            tag: "phonePosition")
        .animate(profileController);
  }

  static void controllersDispose() {
    controller.dispose();
    loginController.dispose();
  }

  static void syncDispose() {
    syncController.dispose();
  }

  static void profileDispose() {
    profileController.dispose();
  }
}
