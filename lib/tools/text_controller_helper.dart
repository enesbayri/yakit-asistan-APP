import 'package:flutter/cupertino.dart';

class TextControllerHelper {
  static TextEditingController fuelCostController =
      TextEditingController(text: "10");
  static TextEditingController distPagefuelCostController =
      TextEditingController(text: "10");

  static TextEditingController addCarNameController = TextEditingController();

  static TextEditingController addTripPageFrom = TextEditingController();
  static TextEditingController addTripPageTo = TextEditingController();
  static TextEditingController addTripPageDist = TextEditingController();
  static TextEditingController addTripPageFuel = TextEditingController();

  //login page
  static TextEditingController loginEmail = TextEditingController();
  static TextEditingController loginPassword = TextEditingController();

  //register page
  static TextEditingController registerEmail = TextEditingController();
  static TextEditingController registerPassword = TextEditingController();
  static TextEditingController registerUsername = TextEditingController();

  //update password
  static TextEditingController updateLastPassword = TextEditingController();
  static TextEditingController updateNewPassword = TextEditingController();

  //update email
  static TextEditingController updateNewEmail = TextEditingController();

  //update username
  static TextEditingController updateUserName = TextEditingController();

  //forgot password
  static TextEditingController forgotPasswordEmail = TextEditingController();

  //phone sign in
  static TextEditingController phoneNumbercontroller = TextEditingController();
  static TextEditingController phoneSmsCodeController = TextEditingController();

  static resetPhoneSignIn() {
    phoneNumbercontroller.clear();
    phoneSmsCodeController.clear();
  }

  static resetLoginPage() {
    loginEmail.clear();
    loginPassword.clear();
  }

  static loginPageValidator() {
    if (loginEmail.text != "" && loginPassword.text != "") return true;
    return false;
  }

  static resetRegisterPage() {
    registerEmail.clear();
    registerPassword.clear();
    registerUsername.clear();
  }

  static registerPageValidator() {
    if (registerEmail.text != "" &&
        registerPassword.text != "" &&
        registerUsername.text != "") return true;
    return false;
  }

  static resetUpdatePage() {
    updateLastPassword.clear();
    updateNewPassword.clear();
    updateNewEmail.clear();
    updateUserName.clear();
  }

  static updatePasswordPageValidator() {
    if (updateLastPassword.text != "" && updateNewPassword.text != "") {
      return true;
    }
    return false;
  }

  static resetForgotPage() {
    forgotPasswordEmail.clear();
  }

  static forgotPageValidator() {
    if (forgotPasswordEmail.text != "") return true;
    return false;
  }

  static updateMailPageValidator() {
    if (updateNewEmail.text != "") return true;
    return false;
  }

  static updateUserNamePageValidator() {
    if (updateUserName.text != "") return true;
    return false;
  }

  static resetCarName() {
    addCarNameController.text = "";
  }

  static bool carNameValidator() {
    if (addCarNameController.text == "") {
      return false;
    } else {
      return true;
    }
  }

  static resetTexts() {
    fuelCostController.text = "";
    distPagefuelCostController.text = "";
  }

  static resetAddTripInputs() {
    addTripPageFrom.text = "";
    addTripPageTo.text = "";
    addTripPageDist.text = "";
    addTripPageFuel.text = "";
  }
}
