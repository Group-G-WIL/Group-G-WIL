import 'package:flutter/material.dart'
    show
        BuildContext,
        ChangeNotifier,
        Key,
        MaterialApp,
        StatelessWidget,
        Widget,
        runApp;
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:royal_salon/routes/routes.dart';
import 'package:royal_salon/services/user_services.dart';
import 'services/geo_locator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ApplBlock(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.loadingPage,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}

class ApplBlock with ChangeNotifier {
  final geoLocatorService = GeoLocatorService();

  late Position currentLocation;

  ApplBlock() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}
