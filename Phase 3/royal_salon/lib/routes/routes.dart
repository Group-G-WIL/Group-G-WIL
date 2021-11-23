// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:royal_salon/pages/Promo_page.dart';
<<<<<<< HEAD
import 'package:royal_salon/pages/client/FindSalon/book.dart';
import 'package:royal_salon/pages/client/FindSalon/map.dart';
import 'package:royal_salon/pages/client/FindSalon/receipt.dart';
import 'package:royal_salon/pages/client/FindSalon/reviews_salon.dart';
import 'package:royal_salon/pages/client/FindSalon/services.dart';
=======
import 'package:royal_salon/pages/client/find_salon/book.dart';
import 'package:royal_salon/pages/client/find_salon/receipt.dart';
import 'package:royal_salon/pages/client/find_salon/reviews_salon.dart';
import 'package:royal_salon/pages/client/find_salon/services.dart';
import 'package:royal_salon/pages/Promo_Addition.dart';
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75
import 'package:royal_salon/pages/client/clientmain_page.dart';
import 'package:royal_salon/WelcomPage/loading.dart';
import 'package:royal_salon/WelcomPage/login.dart';
import 'package:royal_salon/pages/client/find_salon/findsalon.dart';
import 'package:royal_salon/pages/client/register.dart';
import 'package:royal_salon/pages/salon_owner/add_services.dart';
import 'package:royal_salon/pages/salon_owner/salon_login.dart';
import 'package:royal_salon/pages/salon_owner/salonmain_page.dart';
import 'package:royal_salon/routes/edit_account.dart';
import 'package:royal_salon/pages/client/find_salon/get_directions.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String reviewsPage = '/reviewsPage';
  static const String bookPage = '/bookPage';
  static const String recieptPage = '/recieptPage';
  static const String servicesPage = '/servicesPage';
  static const String findsalonPage = '/findsalonPage';
  static const String salonlogin = '/salonLogin';
  static const String registerPage = '/registerPage';
  static const String clientPage = '/clientPage';
  static const String salonPage = '/SalonPage';
  static const String loadingPage = '/loadingPage';
  static const String editAccountPage = '/editAccountPage';
  static const String promotionsPage = '/promotions';
  static const String addPromo = '/PromoAdd';
<<<<<<< HEAD
  static const String mapPage = '/mapPage';
=======
  static const String addServices = '/addServices';
  static const String getDirectionsPage = '/getDirectionsPage';
>>>>>>> 3c27f27b47b062f092991bd418d5d940de9e1f75

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );
      case mapPage:
        return MaterialPageRoute(
          builder: (context) => MapPage(),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (context) => Register(),
        );

      case bookPage:
        return MaterialPageRoute(
          builder: (context) => BookNow(),
        );

      case reviewsPage:
        return MaterialPageRoute(
          builder: (context) => Reviews(),
        );

      case recieptPage:
        return MaterialPageRoute(
          builder: (context) => Reciept(),
        );
      case salonlogin:
        return MaterialPageRoute(
          builder: (context) => SalonLogin(),
        );
      case findsalonPage:
        return MaterialPageRoute(
          builder: (context) => SelectSalon(),
        );
      case clientPage:
        return MaterialPageRoute(
          builder: (context) => ClientMain(),
        );
      case servicesPage:
        return MaterialPageRoute(
          builder: (context) => Services(),
        );

      case salonPage:
        return MaterialPageRoute(
          builder: (context) => SalonPage(),
        );

      case loadingPage:
        return MaterialPageRoute(
          builder: (context) => Loading(),
        );

      case promotionsPage:
        return MaterialPageRoute(builder: (context) => Promotions(GlobalKey));

      case editAccountPage:
        return MaterialPageRoute(
          builder: (context) => EditAccount(),
        );

      case addServices:
        return MaterialPageRoute(
          builder: (context) => ServiceAdd(),
        );

      // case getDirectionsPage:
      //   return MaterialPageRoute(builder: (context) => GetDirections());

      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
