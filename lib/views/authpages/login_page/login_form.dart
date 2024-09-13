// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_controller_helper.dart';
import 'package:yakit_asistan/views/authpages/login_page/forgot_password_button.dart';
import 'package:yakit_asistan/views/authpages/login_page/login_to_register.dart';
import 'package:yakit_asistan/views/authpages/login_page/login_with_social.dart';
import 'package:yakit_asistan/views/authpages/widgets/db_router.dart';
import 'package:yakit_asistan/views/authpages/widgets/login_reg_button.dart';
import 'package:yakit_asistan/views/authpages/widgets/login_register_input.dart';
import 'package:yakit_asistan/views/authpages/widgets/screen_titles.dart';
import 'package:yakit_asistan/views/authpages/widgets/sign_phone_dialog.dart';
import 'package:yakit_asistan/views/commonwidgets/error_snackbar.dart';
import 'package:yakit_asistan/views/commonwidgets/loading_widget.dart';

class LoginFormContents extends StatelessWidget {
  LoginFormContents({
    super.key,
  });
  final AuthService auth = locator<AuthService>();
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const DbRouterChange(),
        Positioned(
          top: screen.height * 0.15,
          child: const LoginRegisterAppTitle(),
        ),
        Positioned(
          top: screen.height * 0.21,
          child: const LoginRegisterSubtitle(text: "Hoş geldiniz!"),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginRegisterInput(
                label: "E-mail",
                icon: Icons.mail,
                obscureText: false,
                textController: TextControllerHelper.loginEmail,
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginRegisterInput(
                label: "Şifre",
                icon: Icons.key,
                obscureText: true,
                textController: TextControllerHelper.loginPassword,
                height: 50,
              ),
              const SizedBox(
                height: 7,
              ),
              ForgotPasswordButton(),
              const SizedBox(
                height: 15,
              ),
              LoginRegisterButton(
                text: "Giriş Yap!",
                onPressed: () async {
                  try {
                    //close keyboard
                    FocusScope.of(context).unfocus();
                    if (!TextControllerHelper.loginPageValidator()) {
                      throw "Lütfen tüm alanları doldurun!";
                    }
                    //loading effect
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          PopScope(canPop: false, child: LoadingWidget()),
                    );
                    await auth.signInWithEmailAndPassword(
                        TextControllerHelper.loginEmail.text,
                        TextControllerHelper.loginPassword.text);
                    TextControllerHelper.resetLoginPage();
                    if (!context.mounted) return;
                    debugPrint("tamamdırrrrrr");
                    //close loading effect
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed("HomePage");
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
          child: LoginToRegister(),
        ),
        Positioned(
          width: screen.width * 0.65,
          bottom: screen.height * 0.15,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginWithSocialCard(
                cardBorderColor: ColorUiHelper.appMainColor,
                title: "Google ile giriş yap!",
                leading: FaIcon(
                  FontAwesomeIcons.google,
                  color: ColorUiHelper.mailIconColor,
                  size: 20,
                ),
                onPressed: () async {
                  debugPrint("google ile giriş basıldı");
                  try {
                    FocusScope.of(context).unfocus();
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          PopScope(canPop: false, child: LoadingWidget()),
                    );
                    await auth.signInWithGoogle();
                    if (!context.mounted) return;
                    //close loading effect
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed("HomePage");
                  } on String catch (error) {
                    //close loading effect
                    Navigator.of(context).pop();
                    ErrorSnackBar.showErrorSnackBar(context, title: error);
                  }
                },
              ),
              Theme.of(context).platform == TargetPlatform.android
                  ? LoginWithSocialCard(
                      cardBorderColor: ColorUiHelper.appMainColor,
                      title: "Telefon ile giriş yap!",
                      leading: Icon(
                        Icons.phone,
                        color: ColorUiHelper.linkedinIconColor,
                        size: 20,
                      ),
                      onPressed: () {
                        debugPrint("telefon ile giriş basıldı");
                        SignPhoneDialog.showPhoneNumberDialog(
                          context,
                          () async {
                            if (TextControllerHelper
                                        .phoneNumbercontroller.text !=
                                    "" &&
                                TextControllerHelper
                                        .phoneNumbercontroller.text.length ==
                                    10) {
                              String phone =
                                  "+90${TextControllerHelper.phoneNumbercontroller.text}";
                              try {
                                await auth.signInWithPhone(
                                  phoneNumber: phone,
                                  getCode: () async {
                                    String inputPin = "";
                                    await SignPhoneDialog.getCodeDialog(
                                      context,
                                      (pin) {
                                        inputPin = pin;
                                        Navigator.of(context).pop();
                                      },
                                    );

                                    Navigator.of(context).pop();
                                    return inputPin;
                                  },
                                  verifyComplated: () {
                                    TextControllerHelper.resetPhoneSignIn();
                                    Navigator.of(context)
                                        .pushReplacementNamed("HomePage");
                                  },
                                  verifyFailed: (error) {
                                    Navigator.of(context).pop();
                                    ErrorSnackBar.showErrorSnackBar(context,
                                        title:
                                            "Opps. Lütfen daha sonra deneyiniz!");
                                  },
                                );

                                if (!context.mounted) return;
                              } on String catch (error) {
                                ErrorSnackBar.showErrorSnackBar(context,
                                    title: error);
                              }
                            } else {
                              ErrorSnackBar.showErrorSnackBar(context,
                                  title: "Geçerli telefon numarası girin!");
                            }
                          },
                        );
                      },
                    )
                  : Container()
            ],
          ),
        )
      ],
    );
  }
}
