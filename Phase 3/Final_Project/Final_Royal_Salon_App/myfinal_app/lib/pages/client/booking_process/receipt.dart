// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfinal_app/pages/client/client_main_page.dart';
import 'package:myfinal_app/pages/client/client_menu/bookings.dart';
import 'package:myfinal_app/services/helper_home.dart';
import 'package:myfinal_app/services/todo_service.dart';
import 'package:provider/provider.dart' as provider;

class Reciept extends StatelessWidget {
  const Reciept({
    Key? key,
    required this.title,
    required this.title1,
    required this.date,
    required this.time,
    required this.booknumber,
  }) : super(key: key);

  final String title;
  final String title1;
  final String date;
  final String time;
  final int booknumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClientMain(),
                ),
              );
            },
            icon: Icon(Icons.home)),
      ),
      body: Card(
        child: Container(
          height: 220,
          color: Colors.cyan[100],
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Thank you for Booking :'),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Booking number  : ' + booknumber.toString()),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Date  : ' + date),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Time  : ' + time),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('HairStyle :' + title),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Total Price :' + title1),
                  ),
                ],
              ),
              // ElevatedButton(
              //   onPressed: () {

              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.purple,
              //   ),
              //   child: Text('Track your booking'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
