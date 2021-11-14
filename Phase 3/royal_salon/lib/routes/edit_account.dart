import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royal_salon/services/userervices.dart';
import 'package:royal_salon/widgets/app_textfield.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
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
      appBar: AppBar(
        title: const Text(
          'Account Settings',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        backgroundColor: Colors.purple[600],
        elevation: 10.0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.purple],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        'Edit Settings',
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
                        onPressed: () async {
                          Navigator.pop;
                        },
                        child: const Text('Make changes'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
