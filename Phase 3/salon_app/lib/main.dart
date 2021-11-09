import 'package:flutter/material.dart';
import 'package:salon_app/pages/booking.dart';
import 'package:salon_app/pages/services.dart';
import 'package:salon_app/pages/sign_up.dart';
import 'package:salon_app/pages/login.dart';
import 'package:salon_app/pages/find_salon.dart';
import 'package:salon_app/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => Loading(),
        '/login': (context) => Login(),
        '/find_salon': (context) => Find_Salon(),
        '/registration': (context) => Sign_Up(),
        '/booking': (context) => Booking(),
        '/view_services': (context) => Services(),
      },
    ));
