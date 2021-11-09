
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Booking()));

class Booking extends StatefulWidget {
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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