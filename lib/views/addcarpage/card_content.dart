import 'package:flutter/cupertino.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/views/addcarpage/add_car_form.dart';
import 'package:yakit_asistan/views/commonwidgets/bottom_back_button.dart';

class AddCarCardContent extends StatelessWidget {
  AddCarCardContent({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -100,
          child: Container(
            width: screen.width,
            height: screen.height / 10 * 5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/addCarIcon.png"),
                    opacity: 0.1,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft)),
          ),
        ),
        Column(
          children: [
            Container(
              width: 100,
              height: 5,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: ColorUiHelper.appMainColor,
                  borderRadius: BorderRadius.circular(24)),
            ),
            const BottomCarBackButton(),
            const AddCarForm()
          ],
        ),
      ],
    );
  }
}
