import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/views/authpages/widgets/login_reg_button.dart';
import 'package:yakit_asistan/views/authpages/widgets/login_register_input.dart';
import 'package:yakit_asistan/views/authpages/widgets/screen_titles.dart';
import 'package:yakit_asistan/views/commonwidgets/error_snackbar.dart';
import 'package:yakit_asistan/views/profilepage/updateprofile/card_title.dart';
import 'package:yakit_asistan/views/profilepage/updateprofile/close_button.dart';

class UpdateUserNameCard extends StatelessWidget {
  UpdateUserNameCard({
    super.key,
  });
  final AuthService auth = locator<AuthService>();
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Align(
          alignment: Alignment.topRight,
          child: CloseUpdateCardButton(),
        ),
        Positioned(
          top: screen.height * 0.15,
          child: const UpdateProfileCardTitle(),
        ),
        Positioned(
          top: screen.height * 0.21,
          child: const LoginRegisterSubtitle(text: "Kullanıcı adı Güncelleme"),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              LoginRegisterInput(
                label: "Yeni kullanıcı adı",
                icon: Icons.mark_email_unread,
                obscureText: false,
                textController: TextControllerHelper.updateUserName,
                height: 50,
              ),
              const SizedBox(
                height: 7,
              ),
              const SizedBox(
                height: 25,
              ),
              LoginRegisterButton(
                text: "Kullanıcı adı güncelle!",
                onPressed: () async {
                  try {
                    if (!TextControllerHelper.updateUserNamePageValidator()) {
                      throw "Lütfen tüm alanları doldurun!";
                    }
                    await auth.updateUserName(
                        TextControllerHelper.updateUserName.text);
                    TextControllerHelper.resetUpdatePage();
                    if (!context.mounted) return;
                    AnimationControll.profileController.reverse();
                    ErrorSnackBar.showErrorSnackBar(context,
                        title: "Kullanıcı adı güncellendi!", isInfo: true);
                  } on String catch (error) {
                    ErrorSnackBar.showErrorSnackBar(context, title: error);
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
