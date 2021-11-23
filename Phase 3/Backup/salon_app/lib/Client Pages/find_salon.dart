import 'package:flutter/material.dart';

//void main() => runApp(MaterialApp(home: Find_Salon()));

class FindSalon extends StatefulWidget {
  const FindSalon({Key? key}) : super(key: key);

  @override
  State<FindSalon> createState() => _FindSalonState();
}

class _FindSalonState extends State<FindSalon> {
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
