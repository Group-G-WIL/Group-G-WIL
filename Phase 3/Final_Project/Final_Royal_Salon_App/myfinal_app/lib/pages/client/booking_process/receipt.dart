// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfinal_app/services/todo_service.dart';
import 'package:provider/provider.dart' as provider;

class Reciept extends StatelessWidget {
  const Reciept({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Card(
        child: Container(
          width: 360,
          height: 150,
          color: Colors.cyan[100],
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Thank you for Booking :'),
              Text('Booking number  :'),
              Text('Date  : '),
              Text('HairStyle :'),
              Text('Total Price :'),
              ElevatedButton(
                onPressed: () {
                  //  Navigator.of(context)
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
