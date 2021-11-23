import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royal_salon/routes/routes.dart';
import 'package:royal_salon/services/userervices.dart';

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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteManager.loadingPage,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}
