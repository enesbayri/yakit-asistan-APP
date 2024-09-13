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

class UpdateMailCard extends StatelessWidget {
  UpdateMailCard({
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
          child: const LoginRegisterSubtitle(text: "Mail Güncelleme"),
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
                label: "Yeni e-mail",
                icon: Icons.mark_email_unread,
                obscureText: false,
                textController: TextControllerHelper.updateNewEmail,
                height: 50,
              ),
              const SizedBox(
                height: 7,
              ),
              const SizedBox(
                height: 25,
              ),
              LoginRegisterButton(
                text: "Mail adresimi güncelle!",
                onPressed: () async {
                  try {
                    if (!TextControllerHelper.updateMailPageValidator()) {
                      throw "Lütfen tüm alanları doldurun!";
                    }
                    await auth
                        .updateMail(TextControllerHelper.updateNewEmail.text);
                    TextControllerHelper.resetUpdatePage();
                    if (!context.mounted) return;
                    ErrorSnackBar.showErrorSnackBar(context,
                        title: "Yeni mail adresinizi onaylayın!", isInfo: true);
                    AnimationControll.profileController.reverse();
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
