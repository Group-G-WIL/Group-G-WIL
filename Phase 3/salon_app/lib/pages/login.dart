
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Login()));

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" "),

      ),
      body: const SafeArea(
        child: Text("Hello"),
      ),
      
    );
  }
}