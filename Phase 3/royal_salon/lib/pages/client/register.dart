import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royal_salon/services/user_helper.dart';
import 'package:royal_salon/services/user_services.dart';
import 'package:royal_salon/widgets/app_progress_indicator.dart';
import 'package:royal_salon/widgets/app_textfield.dart';
import 'package:tuple/tuple.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController usernameController;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController phonenumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
    phonenumberController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    surnameController.dispose();
    phonenumberController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.purple, Colors.blue],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        'Client Sign in',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ),
                    AppTextField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      labelText: 'Please enter your name',
                    ),
                    AppTextField(
                      keyboardType: TextInputType.text,
                      controller: surnameController,
                      labelText: 'Please enter your surname',
                    ),
                    //gender
                    Focus(
                      onFocusChange: (value) async {
                        if (!value) {
                          context.read<UserService>().checkIfUserExists(
                              usernameController.text.trim());
                        }
                      },
                      child: AppTextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: usernameController,
                        labelText: 'Please enter your email address',
                      ),
                    ),
                    Selector<UserService, bool>(
                      selector: (context, value) => value.userExists,
                      builder: (context, value, child) {
                        return value
                            ? const Text(
                                'username exists, please choose another',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Container();
                      },
                    ),
                    AppTextField(
                      keyboardType: TextInputType.phone,
                      controller: phonenumberController,
                      labelText: 'Please enter your phone number',
                    ),
                    AppTextField(
                      hideText: true,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      labelText: 'Please enter your password',
                    ),
                    AppTextField(
                      hideText: true,
                      keyboardType: TextInputType.text,
                      controller: confirmController,
                      labelText: 'Please confirm your password',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                        onPressed: () {
                          createNewUserInUI(
                            context,
                            email: usernameController.text.trim(),
                            password: passwordController.text.trim(),
                            name: nameController.text.trim(),
                            surname: surnameController.text.trim(),
                            cellphone: phonenumberController.text.trim(),
                            confirm: confirmController.text.trim()
                          );
                        },
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
    );
  }
}
