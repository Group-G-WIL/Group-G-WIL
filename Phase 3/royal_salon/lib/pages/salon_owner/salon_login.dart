// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royal_salon/routes/routes.dart';
import 'package:royal_salon/services/user_helper.dart';
import 'package:royal_salon/services/userervices.dart';
import 'package:royal_salon/widgets/app_progress_indicator.dart';
import 'package:royal_salon/widgets/app_textfield.dart';
import 'package:tuple/tuple.dart';

class SalonLogin extends StatefulWidget {
  const SalonLogin({Key? key}) : super(key: key);

  @override
  _SalonLoginState createState() => _SalonLoginState();
}

class _SalonLoginState extends State<SalonLogin> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 30,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        'Salon Owner Login',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ),
                    AppTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: usernameController,
                      labelText: 'Please enter email address',
                    ),
                    AppTextField(
                      hideText: true,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      labelText: 'Please enter your password',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          loginSalonInUI(context,
                              email: usernameController.text,
                              password: passwordController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),

                        child: const Text('Login'),

                        // ignore: prefer_const_constructors
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RouteManager.registerPage);
                      },
                      child: const Text('Register Now'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () async {
                        resetPasswordInUI(context,
                            email: usernameController.text);
                      },
                      child: const Text('Reset Password'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Selector<UserService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.showUserProgress, value.userProgressText),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(text: '${value.item2}')
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
