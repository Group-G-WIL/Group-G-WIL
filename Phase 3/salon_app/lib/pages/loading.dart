import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Loading()));

class Loading extends StatefulWidget {
  //const Loading(Key? key) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
