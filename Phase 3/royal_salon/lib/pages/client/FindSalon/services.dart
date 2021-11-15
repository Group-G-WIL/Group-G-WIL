import 'package:flutter/material.dart';
import 'package:royal_salon/routes/routes.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 150,
                width: 250,
                color: Colors.deepPurple[50],
              ),
            ),
          ),
          Container(color: Colors.amber[50], child: Text('List of Services')),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 250,
            color: Colors.black54,
            child: Column(
              children: [
                Text('HairStyle name:'),
                Text('Price:'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteManager.bookPage);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: Text('Book'),
                ),
              ],
            ),
          ),
          Container(color: Colors.amber[50], child: Text('Our Promotions')),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 250,
            color: Colors.black54,
            child: Column(
              children: [
                Text('HairStyle name:'),
                Text('Price:'),
                Text('ExpDate:'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteManager.bookPage);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: Text('Book'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NoServices extends StatelessWidget {
  const NoServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: Center(
        child: Text('No Services Yet...'),
      ),
    );
  }
}
