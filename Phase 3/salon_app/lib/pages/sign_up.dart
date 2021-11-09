import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Sign_Up()));

class Sign_Up extends StatefulWidget {
  //const Sign_Up(Key? key) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
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
