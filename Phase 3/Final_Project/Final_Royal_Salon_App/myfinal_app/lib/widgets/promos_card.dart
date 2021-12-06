import 'package:flutter/material.dart';
import 'package:myfinal_app/models/promo.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/pages/client/booking_process/book_promo.dart';
import 'package:myfinal_app/routes/routes.dart';

class DisplayPromo extends StatelessWidget {
  const DisplayPromo({
    Key? key,
    required this.promo,
  }) : super(key: key);
  final Promo promo;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade300,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'HairStyle name: ' + promo.stylename,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Price: " + promo.discount,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120.0),
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'last day: ' + promo.lastday,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookNow1(
                    title1: promo.stylename,
                    title2: promo.discount,
                  ),
                ),
              );
            },
            child: Text('Book'),
          ),
        ],
      ),
    );
  }
}
