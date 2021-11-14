import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:royal_salon/routes/routes.dart';
import 'package:royal_salon/services/userervices.dart';

class InitApp {
  static const String apiKeyAndroid = '06F80D28-220D-462C-A81F-C4486CEE570A';
  static const String apiKeyiOS = 'EAA35D4D-8E0A-4504-A2A3-8966199525B9';
  static const String appID = '402DF39D-2B97-9100-FF22-5B89BBAAFB00';

  static void initializeApp(BuildContext context) async {
    await Backendless.initApp(
        applicationId: appID,
        iosApiKey: apiKeyiOS,
        androidApiKey: apiKeyAndroid);

    String result = await context.read<UserService>().checkIfUserLoggedIn();
    if (result == 'OK') {
      Navigator.popAndPushNamed(context, RouteManager.clientPage);
    } else {
      Navigator.popAndPushNamed(context, RouteManager.loginPage);
    }
  }
}
