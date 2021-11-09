
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Find_Salon()));

class Find_Salon extends StatefulWidget {
  @override
  State<Find_Salon> createState() => _Find_SalonState();
}

class _Find_SalonState extends State<Find_Salon> {
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