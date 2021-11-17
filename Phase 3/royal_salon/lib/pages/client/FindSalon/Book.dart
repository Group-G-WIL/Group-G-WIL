// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:royal_salon/routes/routes.dart';

class BookNow extends StatelessWidget {
  const BookNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 45),
        child: Container(
          height: 150,
          width: 250,
          color: Colors.black54,
          child: Column(
            children: [
              const Text('SetDate:'),
              const Text('Payment method:'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.recieptPage);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: const Text('Book Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
