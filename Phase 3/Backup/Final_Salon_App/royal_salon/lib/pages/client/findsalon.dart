import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:royal_salon/routes/routes.dart';

class findSalon extends StatelessWidget {
  const findSalon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RouteManager.findsalonPage);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
          ),
          child: Text('Find a salon'),
        ),
      ),
    );
  }
}

class SelectSalon extends StatefulWidget {
  @override
  _SelectSalonState createState() => _SelectSalonState();
}

class _SelectSalonState extends State<SelectSalon> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Find a Salon'),
        ),
        backgroundColor: Colors.cyan[100],
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  width: 150,
                  //text control
                  child: Text('Enter your location'),
                ),
              ),
            ),
            Container(
              color: Colors.red,
              height: 250,
              width: 250,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    IconButton(
                      icon: Icon(Icons.home_work_outlined),
                      onPressed: showBottomSheet,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      icon: Icon(Icons.home_work_outlined),
                      onPressed: showBottomSheet1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  void showBottomSheet1() => showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      barrierColor: Colors.orange.withOpacity(0.2),
      context: context,
      builder: (context) => Container(
            height: 180,
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salon name',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Salon Address')
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.servicesPage);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        child: Text('Services'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.reviewsPage);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        child: Text('View Reviews'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .pushNamed(RouteManager.findsalonPage);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        child: Text('Get Directions'),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context)
                    //     .pushNamed(RouteManager.findsalonPage);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: Text('Add to favourites'),
                ),
              ],
            ),
          ));

  void showBottomSheet() => showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        barrierColor: Colors.orange.withOpacity(0.2),
        context: context,
        builder: (context) => Container(
          height: 100,
          child: Text(
            'Sorry the salon will open at //time',
            textAlign: TextAlign.center,
          ),
        ),
      );
}

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

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Column(
        children: [
          Container(color: Colors.amber[50], child: Text('Reviews list')),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              children: [
                Text('Ratings'),
                Row(
                  children: [Text('Categories'), Text('Rates')],
                ),
                Row(
                  children: [Text('Hygiene'), Text('Rates')],
                ),
                Row(
                  children: [Text('HairStyle'), Text('Rates')],
                ),
                Row(
                  children: [Text('Categories'), Text('Rates')],
                ),
                Row(
                  children: [Text('Categories'), Text('Rates')],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NoReviews extends StatelessWidget {
  const NoReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Center(
        child: Text('No Reviews Yet...'),
      ),
    );
  }
}

class BookNow extends StatelessWidget {
  const BookNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 45),
        child: Container(
          height: 150,
          width: 250,
          color: Colors.black54,
          child: Column(
            children: [
              Text('SetDate:'),
              Text('Patment method:'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.recieptPage);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: Text('Book Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
