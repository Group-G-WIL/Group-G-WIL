import 'package:flutter/material.dart';
import 'package:salon_app/Welcome%20Page/welcome_page.dart';
import 'package:salon_app/custom_classes/constant.dart';
import 'package:salon_app/custom_classes/splash_screen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        /*
      initialRoute: '/login',
      routes: {
        '/': (context) => Loading(),

        '/Welcome_Page': (context) => const WelcomePage(),
        '/login': (context) => Login(),
        '/find_salon': (context) => Find_Salon(),
        '/registration': (context) => Sign_Up(),
        '/booking': (context) => Booking(),
        '/view_services': (context) => Services(),
      },
      */
        routes: <String, WidgetBuilder>{
          profile: (BuildContext context) {
            return const WelcomePage();
          }
        },
      ),
    );
