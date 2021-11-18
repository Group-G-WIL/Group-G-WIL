// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Reciept extends StatelessWidget {
  const Reciept({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 45),
        child: Container(
          height: 150,
          width: 250,
          color: Colors.black54,
          child: Column(
            children: [
              Text('Thank you for Booking:'),
              Text('Booking number:'),
              Text('Date:'),
              Text('HairStyle:'),
              Text('Total Price:'),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context)
                  //     .pushNamed(RouteManager.findsalonPage);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: Text('Track your booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
