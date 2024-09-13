import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yakit_asistan/models/car.dart';
import 'package:yakit_asistan/views/about_page.dart/about_page.dart';
import 'package:yakit_asistan/views/addcarpage/add_car_page.dart';
import 'package:yakit_asistan/views/addtrippage/add_trip_page.dart';
import 'package:yakit_asistan/views/authpages/forgot_password_page/forgot_password_page.dart';
import 'package:yakit_asistan/views/authpages/login_page/login_page.dart';
import 'package:yakit_asistan/views/authpages/register_page/register_page.dart';
import 'package:yakit_asistan/views/calculatepages/consumppage/consump_page.dart';
import 'package:yakit_asistan/views/calculatepages/disttocostpage/dist_to_cost_page.dart';
import 'package:yakit_asistan/views/calculatepages/fueltodistpage/fuel_to_dist_page.dart';
import 'package:yakit_asistan/views/cardetailpage/car_detail_page.dart';
import 'package:yakit_asistan/views/contactpage/contact_page.dart';
import 'package:yakit_asistan/views/fueldetailpage/fuel_detail_page.dart';
import 'package:yakit_asistan/views/home.dart/home_page.dart';
import 'package:yakit_asistan/views/home.dart/page_navigation.dart';
import 'package:yakit_asistan/views/policypage/policy_page.dart';
import 'package:yakit_asistan/views/profilepage/profile_page.dart';
import 'package:yakit_asistan/views/syncpage/sync_page.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == "CarDetailPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const CarDetailPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const CarDetailPage(),
        );
      }
    } else if (settings.name == "ConsumpPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const ConsumpPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const ConsumpPage(),
        );
      }
    } else if (settings.name == "DistToCostPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const DistToCostPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const DistToCostPage(),
        );
      }
    } else if (settings.name == "FuelToDistPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const FuelToDistPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const FuelToDistPage(),
        );
      }
    } else if (settings.name == "HomePage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const HomePage(),
        );
      }
    } else if (settings.name == "LocalHomePage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const PageNavigation(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const PageNavigation(),
        );
      }
    } else if (settings.name == "AddCarPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const AddCarPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const AddCarPage(),
        );
      }
    } else if (settings.name == "AddTripPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) =>
              AddTripPage(cars: settings.arguments as List<Car>),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) =>
              AddTripPage(cars: settings.arguments as List<Car>),
        );
      }
    } else if (settings.name == "PolicyPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const PolicyPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const PolicyPage(),
        );
      }
    } else if (settings.name == "MyProfilePage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const MyProfilePage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const MyProfilePage(),
        );
      }
    } else if (settings.name == "ContactUsPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const ContactUsPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const ContactUsPage(),
        );
      }
    } else if (settings.name == "SynchroPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const SynchroPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const SynchroPage(),
        );
      }
    } else if (settings.name == "AboutPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const AboutPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const AboutPage(),
        );
      }
    } else if (settings.name == "LoginPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const LoginPage(),
        );
      }
    } else if (settings.name == "RegisterPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const RegisterPage(),
        );
      }
    } else if (settings.name == "ForgotPasswordPage") {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );
      }
    } else if (settings.name == "FuelDetailPage") {
      var arg = settings.arguments as Map<String, dynamic>;
      String company = arg["company"] as String;
      Color color = arg["color"] as Color;
      if (defaultTargetPlatform == TargetPlatform.android) {
        return MaterialPageRoute(
          builder: (context) => FeulDetailPage(
            company: company,
            mainColor: color,
          ),
        );
      } else {
        return CupertinoPageRoute(
          builder: (context) => FeulDetailPage(
            company: company,
            mainColor: color,
          ),
        );
      }
    }

    return null;
  }
}
