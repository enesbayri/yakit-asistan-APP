import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/views/authpages/widgets/back_button.dart';
import 'package:yakit_asistan/views/authpages/widgets/login_reg_button.dart';
import 'package:yakit_asistan/views/authpages/widgets/login_register_input.dart';
import 'package:yakit_asistan/views/authpages/widgets/screen_titles.dart';
import 'package:yakit_asistan/views/commonwidgets/alert_dialog_empty.dart';
import 'package:yakit_asistan/views/commonwidgets/error_snackbar.dart';

class ForgotPasswordPageContent extends StatelessWidget {
  ForgotPasswordPageContent({super.key});

  final AuthService auth = locator<AuthService>();
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: BackFromLoginAndRegisterPage(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Positioned(
          top: screen.height * 0.17,
          child: const LoginRegisterAppTitle(),
        ),
        Positioned(
          top: screen.height * 0.25,
          child: const LoginRegisterSubtitle(text: "Şifremi Unuttum!"),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginRegisterInput(
                label: "E-mail adresiniz",
                icon: Icons.mail,
                obscureText: false,
                textController: TextControllerHelper.forgotPasswordEmail,
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 7,
              ),
              const SizedBox(
                height: 15,
              ),
              LoginRegisterButton(
                text: "Şifre linki gönder!",
                onPressed: () {
                  bool isEmpty = TextControllerHelper.forgotPageValidator();
                  if (isEmpty) {
                    AlertDialogForEmptyDataControll
                        .showForgotPasswordLinkDialog(
                      context: context,
                      accessButtonTitle: "Gönder",
                      title: "Şifre değiştirme linki gönderilsin mi?",
                      onAccessPressed: () async {
                        Navigator.of(context).pop();
                        try {
                          await auth.sendPasswordResetCode(
                              TextControllerHelper.forgotPasswordEmail.text);
                          TextControllerHelper.resetForgotPage();
                          if (!context.mounted) return;
                          ErrorSnackBar.showErrorSnackBar(context,
                              title: "Mail adresinize link gönderildi!",
                              isInfo: true);
                        } on String catch (error) {
                          ErrorSnackBar.showErrorSnackBar(context,
                              title: error);
                        }
                      },
                      onBackPressed: () {
                        Navigator.of(context).pop();
                      },
                    );
                  } else {
                    ErrorSnackBar.showErrorSnackBar(context,
                        title: "Lütfen mail adresinizi girin!");
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
