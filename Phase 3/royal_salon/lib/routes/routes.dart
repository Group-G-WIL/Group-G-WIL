import 'package:flutter/material.dart';
import 'package:royal_salon/pages/client/clientmain_page.dart';
import 'package:royal_salon/WelcomPage/loading.dart';
import 'package:royal_salon/WelcomPage/login.dart';
import 'package:royal_salon/pages/client/findsalon.dart';
import 'package:royal_salon/pages/client/register.dart';
import 'package:royal_salon/pages/salon_owner/salon_login.dart';
import 'package:royal_salon/pages/salon_owner/salonmain_page.dart';
import 'package:royal_salon/routes/edit_account.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String findsalonPage = '/findsalonPage';
  static const String salonlogin = '/salonLogin';
  static const String registerPage = '/registerPage';
  static const String clientPage = '/clientPage';
  static const String salonPage = '/SalonPage';
  static const String loadingPage = '/loadingPage';
  static const String editAccountPage = '/editAccountPage';
  

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );

      case registerPage:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );

      case salonlogin:
        return MaterialPageRoute(
          builder: (context) => const SalonLogin(),
        );
      case findsalonPage:
        return MaterialPageRoute(
          builder: (context) => const SelectSalon(),
        );
      case clientPage:
        return MaterialPageRoute(
          builder: (context) => const ClientMain(),
        );

      case salonPage:
        return MaterialPageRoute(
          builder: (context) => const SalonPage(),
        );

      case loadingPage:
        return MaterialPageRoute(
          builder: (context) => const Loading(),
        );

      case editAccountPage:
        return MaterialPageRoute(
          builder: (context) => const EditAccount(),
        );

      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
