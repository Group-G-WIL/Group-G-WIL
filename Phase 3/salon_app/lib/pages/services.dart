import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Services()));

class Services extends StatefulWidget {
  //const Services(Key? key) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
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
