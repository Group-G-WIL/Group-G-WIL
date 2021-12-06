import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({
    Key? key,
    required this.title1,
    required this.name,
    required this.price,
    required this.date,
    required this.time,
  }) : super(key: key);

  final int title1;
  final String name;
  final String price;

  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return title1 == 0
        ? NoBookings()
        : Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('Track Your Bookings'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.black45,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Salon name:'),
                          Text("Price: " + price),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('HairStyle name:' + name),
                          Text(
                            "Date: " + date,
                          )
                        ],
                      ),
                      Text('Boooking number: ' + title1.toString()),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('View Invoice'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

class NoBookings extends StatelessWidget {
  const NoBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('No Bookings')),
    );
  }
}
