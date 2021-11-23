import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Favourites'),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.black38,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('Salon Name:'),
                const Text('Salon Address'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('View Services'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Get Directions'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Remove'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NoFavourites extends StatelessWidget {
  const NoFavourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Favourites'),
      ),
    );
  }
}
