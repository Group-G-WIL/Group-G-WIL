import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text('Working Schedule'),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.black38,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Mon'),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '09:00 - 17:00',
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Tue'),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '09:00 - 17:00',
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Wed'),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '09:00 - 17:00',
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Thurs'),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '09:00 - 17:00',
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Fri'),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '09:00 - 17:00',
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Sat'),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '09:00 - 17:00',
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Sun'),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '09:00 - 17:00',
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
