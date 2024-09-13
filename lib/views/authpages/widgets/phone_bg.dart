import 'package:flutter/cupertino.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';

class LoginRegisterPhoneBG extends StatefulWidget {
  const LoginRegisterPhoneBG({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<LoginRegisterPhoneBG> createState() => _LoginRegisterPhoneBGState();
}

class _LoginRegisterPhoneBGState extends State<LoginRegisterPhoneBG>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    createAnimation();
  }

  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    AnimationControll.loginController.forward();
    return AnimatedBuilder(
      animation: AnimationControll.loginController,
      builder: (context, child) => Align(
        alignment: Alignment.center,
        child: Transform.translate(
          offset: Offset(0,
              AnimationControll.loginSequenceAnimation["phonePosition"].value),
          child: Transform.scale(
            scale: AnimationControll.loginSequenceAnimation["phoneScale"].value,
            child: Container(
              width: screen.width * 0.85,
              height: screen.height * 0.85,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/loginbg/phone.png"),
                      fit: BoxFit.fill)),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  void createAnimation() {
    AnimationControll.createLoginPageAnimation();
  }
}
