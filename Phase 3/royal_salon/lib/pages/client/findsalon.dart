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

class SelectSalon extends StatelessWidget {
  const SelectSalon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Google maps'),
    ));
  }
}

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GetDirections extends StatelessWidget {
  const GetDirections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BookNow extends StatelessWidget {
  const BookNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Reciept extends StatelessWidget {
  const Reciept({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
