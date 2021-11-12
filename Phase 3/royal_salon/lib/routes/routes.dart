import 'package:flutter/material.dart';
import 'package:royal_salon/pages/client/clientmain_page.dart';
import 'package:royal_salon/WelcomPage/loading.dart';
import 'package:royal_salon/WelcomPage/login.dart';
import 'package:royal_salon/pages/client/register.dart';
import 'package:royal_salon/pages/salon_owner/salon_login.dart';
import 'package:royal_salon/pages/salon_owner/salonmain_page.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String salonlogin = '/salonLogin';
  static const String registerPage = '/registerPage';
  static const String clientPage = '/clientPage';
  static const String salonPage = '/SalonPage';
  static const String loadingPage = '/loadingPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );

      case registerPage:
        return MaterialPageRoute(
          builder: (context) => Register(),
        );

      case salonlogin:
        return MaterialPageRoute(
          builder: (context) => SalonLogin(),
        );

      case clientPage:
        return MaterialPageRoute(
          builder: (context) => ClientMain(),
        );

      case salonPage:
        return MaterialPageRoute(
          builder: (context) => SalonPage(),
        );

      case loadingPage:
        return MaterialPageRoute(
          builder: (context) => Loading(),
        );

      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
