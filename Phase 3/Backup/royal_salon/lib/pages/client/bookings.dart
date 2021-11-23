import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  children: const [
                    Text('Salon name:'),
                    Text("Price"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('HairStyle name:'),
                    Text("Date:"),
                  ],
                ),
                const Text('Boooking number:'),
                const Text('Number of people left before you:'),
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
