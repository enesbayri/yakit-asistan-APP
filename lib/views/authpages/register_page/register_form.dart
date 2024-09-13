// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/views/authpages/register_page/register_to_login.dart';
import 'package:yakit_asistan/views/authpages/widgets/db_router_register.dart';
import 'package:yakit_asistan/views/authpages/widgets/login_reg_button.dart';
import 'package:yakit_asistan/views/authpages/widgets/login_register_input.dart';
import 'package:yakit_asistan/views/authpages/widgets/screen_titles.dart';
import 'package:yakit_asistan/views/commonwidgets/error_snackbar.dart';
import 'package:yakit_asistan/views/commonwidgets/loading_widget.dart';

class RegisterFormContents extends StatelessWidget {
  RegisterFormContents({super.key});

  final AuthService auth = locator<AuthService>();
  var screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const DbRouterChangeRegister(),
        Positioned(
          top: screen.height * 0.1,
          child: const LoginRegisterAppTitle(),
        ),
        Positioned(
          top: screen.height * 0.16,
          child: const LoginRegisterSubtitle(text: "Hoş geldiniz!"),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginRegisterInput(
                label: "Kullanıcı Adı",
                icon: Icons.account_circle_rounded,
                obscureText: false,
                textController: TextControllerHelper.registerUsername,
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginRegisterInput(
                label: "E-mail",
                icon: Icons.email,
                obscureText: false,
                textController: TextControllerHelper.registerEmail,
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginRegisterInput(
                label: "Şifre",
                icon: Icons.key,
                obscureText: true,
                textController: TextControllerHelper.registerPassword,
                height: 50,
              ),
              const SizedBox(
                height: 30,
              ),
              LoginRegisterButton(
                text: "Üye Ol!",
                onPressed: () async {
                  try {
                    //close keyboard
                    FocusScope.of(context).unfocus();
                    if (!TextControllerHelper.registerPageValidator()) {
                      throw "Lütfen tüm alanları doldurun!";
                    }
                    // loading effect
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          PopScope(canPop: false, child: LoadingWidget()),
                    );
                    await auth.createUserWithEmailAndPassword(
                        TextControllerHelper.registerEmail.text,
                        TextControllerHelper.registerPassword.text,
                        TextControllerHelper.registerUsername.text);
                    if (!context.mounted) return;
                    ErrorSnackBar.showErrorSnackBar(context,
                        title: "Hesabınız oluşturuldu!", isInfo: true);
                    TextControllerHelper.resetRegisterPage();
                    //close loading effect
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed("LoginPage");
                  } on String catch (error) {
                    //close loading effect
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                    ErrorSnackBar.showErrorSnackBar(context, title: error);
                  }
                },
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: RegisterToLogin(),
        )
      ],
    );
  }
}
