import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yakit_asistan/tools/color_helper.dart';

class TextStyleHelper {
  static TextStyle cardHeaderStyle = GoogleFonts.montserrat(
      fontSize: 22, fontWeight: FontWeight.bold, height: 0.5);
  //TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 0.5);
  static TextStyle cardContentTypeStyle = GoogleFonts.montserrat(
      fontSize: 18, fontWeight: FontWeight.bold, height: 1);
  //TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle appbarStyle = GoogleFonts.montserrat(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      height: 0.5,
      color: ColorUiHelper.appbarTextColor);
  static TextStyle appbarSecondStyle = GoogleFonts.montserrat(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      height: 0.5,
      color: ColorUiHelper.appBgColor);

  static TextStyle calcutesCardTitleStyle = GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      height: 1,
      color: ColorUiHelper.calcutesTextColor);
  static TextStyle calcutesCardSubtitleStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.2,
      color: ColorUiHelper.calcutesTextColor.withOpacity(0.7));

  static TextStyle myCarsSortButtonsStyle =
      GoogleFonts.montserrat(fontSize: 16, color: ColorUiHelper.appMainColor);
  static TextStyle phoneSignInLabelStyle = GoogleFonts.montserrat(
      fontSize: 16, color: ColorUiHelper.appMainColor, height: 0.1);
  static TextStyle myCarsSortButtonsPressedStyle =
      GoogleFonts.montserrat(fontSize: 16, color: ColorUiHelper.appBgColor);

  static TextStyle fuelConsumpBarStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 1,
      color: ColorUiHelper.appBgColor);
  static TextStyle fuelConsumpBarTitleStyle = GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: ColorUiHelper.appMainColor);

  static TextStyle carDetailCardItemStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.2,
      color: ColorUiHelper.calcutesTextColor.withOpacity(0.7));

  static TextStyle tripsCardTitleStyle = GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 1,
      color: ColorUiHelper.calcutesTextColor);
  static TextStyle tripsCardSubtitleStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.2,
      color: ColorUiHelper.calcutesTextColor.withOpacity(0.7));

  static TextStyle tripsCarName = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: ColorUiHelper.appMainColor);

  static TextStyle tripsSelectedCarNameStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 1,
      color: ColorUiHelper.carsSortColor);
  static TextStyle tripsFilterTitleStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1,
      color: ColorUiHelper.appMainColor);

  static TextStyle pageTitleStyle = GoogleFonts.montserrat(
      fontSize: 20, fontWeight: FontWeight.bold, height: 0.5);

  static TextStyle calcPageCardInputStyle = GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.appBgColor);
  static TextStyle calcPageCardInputLabelStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: ColorUiHelper.appBgColor.withOpacity(0.7));

  static TextStyle calcConsumpSheetStyle = GoogleFonts.montserrat(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      height: 0.5,
      color: ColorUiHelper.appSecondColor);

  static TextStyle calcChangeButtontStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 1,
      color: ColorUiHelper.appSecondColor);

  static TextStyle textInputStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: ColorUiHelper.appMainColor);
  static TextStyle textInputPhoneSignStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 0.5,
      color: ColorUiHelper.appMainColor);
  static TextStyle textSecondInputStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: ColorUiHelper.appMainColor);
  static TextStyle fuelInputSubtitleStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: ColorUiHelper.appBgColor);
  static TextStyle textInputLabelStyle = GoogleFonts.montserrat(
    fontSize: 18,
    color: ColorUiHelper.appSecondColor,
    backgroundColor: ColorUiHelper.appMainColor,
  );

  static TextStyle addCarInputsLabel = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 0.5,
      color: ColorUiHelper.appMainColor);
  static TextStyle showWarningCardTitle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 1,
      color: ColorUiHelper.appMainColor);
  static TextStyle addCarInputName = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 0.3,
      color: ColorUiHelper.appMainColor);

  static TextStyle addButtonStyle = GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 0.5,
      color: ColorUiHelper.appBgColor);

  static TextStyle addCarAlert = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorUiHelper.errorBarTextColor,
  );

  static TextStyle addTripButtonStyle = GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.appBgColor,
      height: 1);

  static TextStyle alertDialogDeleteButton = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.appBgColor,
      height: 1);
  static TextStyle alertDialogBackButton = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorUiHelper.appMainColor,
      height: 1);

  static TextStyle emptyDataStyle = GoogleFonts.montserrat(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: ColorUiHelper.appBgColor,
      height: 1);

  static TextStyle menuButtonTitleStyle = GoogleFonts.montserrat(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorUiHelper.appBgColor);

  static TextStyle bottomNavigationBarStyle = GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: ColorUiHelper.appSecondColor,
      height: 1);

//privacy page
  static TextStyle policyTitleStyle = GoogleFonts.montserrat(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.policyTitleColor);
  static TextStyle policySubTitleStyle = GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.policyTitleColor);
  static TextStyle policyContentStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.policyTitleColor);

  static TextStyle contactUsStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorUiHelper.appMainColor);

  static TextStyle contactUsTitleStyle = GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 0.5,
      color: ColorUiHelper.appMainColor);

  static TextStyle addTripTitleStyle = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1,
    color: ColorUiHelper.appBgColor,
  );

  //login page styles
  static TextStyle forgotPasswordStyle = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 0.1,
    color: ColorUiHelper.appSecondColor,
  );
  static TextStyle loginButtonStyle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 0.5,
    color: ColorUiHelper.appBgColor,
  );
  static TextStyle loginAppNameTitleStyle = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.5,
    color: ColorUiHelper.appMainColor,
  );
  static TextStyle loginWelcomeStyle = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: ColorUiHelper.appMainColor,
  );
  static TextStyle loginTitleButtonStyle = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 0.5,
    color: ColorUiHelper.apploginSecondColor,
  );

  static TextStyle loginWithSocialStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 0.5,
      color: ColorUiHelper.appMainColor);

  //sync page styles
  static TextStyle syncWarningSubtitleStyle = GoogleFonts.montserrat(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 1.4,
      color: ColorUiHelper.policyTitleColor);

  static TextStyle syncCenterTitleStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: ColorUiHelper.policyTitleColor);

  static TextStyle syncStartButtonStyle = GoogleFonts.montserrat(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: ColorUiHelper.appBgColor);

  static TextStyle syncPageNameStyle = GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.w900,
      color: ColorUiHelper.syncPageMainColor);

  static TextStyle syncDBNameStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorUiHelper.syncPageCurrentborderColor);

  static TextStyle errorBarInfoStyle = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorUiHelper.errorBarSecondTextColor,
  );

  static TextStyle smsCodeStyle = GoogleFonts.montserrat(
    fontSize: 22,
    color: ColorUiHelper.appMainColor,
  );

  //Profile page styles
  static TextStyle profileNameStyle = GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1,
      color: ColorUiHelper.appBgColor);

  static TextStyle profileDetailsStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorUiHelper.appMainColor);

  static TextStyle profileCarNameStyle = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: ColorUiHelper.appBgColor);

  static TextStyle aboutPageIntrostyle = GoogleFonts.montserrat(
      shadows: <Shadow>[
        const Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 3.0,
          color: Color.fromARGB(255, 0, 0, 0),
        )
      ],
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.2,
      color: ColorUiHelper.appBgColor);

  static TextStyle horizontalScroolStyle(isActive) => GoogleFonts.montserrat(
        fontSize: (isActive) ? 22 : 14,
        fontWeight: (isActive) ? FontWeight.bold : FontWeight.w400,
        color: (isActive)
            ? ColorUiHelper.appSecondColor
            : ColorUiHelper.appBgColor.withOpacity(0.7),
      );
} //barlow  inter     montserrat
