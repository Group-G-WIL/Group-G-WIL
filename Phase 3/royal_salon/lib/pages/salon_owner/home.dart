import 'package:flutter/material.dart';
import 'package:royal_salon/routes/routes.dart';
import 'package:royal_salon/widgets/dialogs.dart';

class ServiesSalon extends StatefulWidget {
  const ServiesSalon({Key? key}) : super(key: key);

  @override
  _ServiesSalonState createState() => _ServiesSalonState();
}

class _ServiesSalonState extends State<ServiesSalon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 805.0,
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              'List of Services',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              child: Row(children: [
                Column(
                  children: [
                    Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Text('HairStyle   : xxx'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Price   : xxx'),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.person,
                      size: 50,
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                titleTextStyle: const TextStyle(
                                  fontSize: 20.0,
                                ),
                                content: const Text(
                                    'Are you sure you want to Delete This Service?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      showSnackBar(context, 'Cancelled!');
                                      Navigator.pop(context);
                                    },
                                    child: const Text(' NO '),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showSnackBar(context, 'Deleted!');
                                      Navigator.pop(
                                        context,
                                      );
                                    },
                                    child: const Text(' Yes '),
                                  ),
                                ]);
                          },
                        );
                      },
                      child: const Text('Remove'),
                    ),
                  ],
                ),
              ]),
            ),
            ElevatedButton(
                style: const ButtonStyle(),
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.addServices);
                },
                child: const Text('Add Services')),
          ],
        ),
      ),
    );
  }
}
