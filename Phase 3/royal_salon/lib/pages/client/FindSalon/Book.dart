// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:royal_salon/routes/routes.dart';
import 'package:royal_salon/widgets/dialogs.dart';
import 'package:royal_salon/widgets/payment_Alert.dart';

class BookNow extends StatefulWidget {
  const BookNow({Key? key}) : super(key: key);

  @override
  State<BookNow> createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  late String initialVal = 'Hair-Cutting';
  late DateTime date;
  late TimeOfDay time;
  late DateTime selectedDay;

  late TextEditingController mailController;
  late TextEditingController carNumberController;
  late TextEditingController ccvController;
  late TextEditingController accHolderNameController;
  late String email;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    time = TimeOfDay.now();
    selectedDay = DateTime.now();

    mailController = TextEditingController();
    carNumberController = TextEditingController();
    ccvController = TextEditingController();
    accHolderNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Make A Booking',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[50],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  'Select Type Of Service : ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent),
                ),
                const SizedBox(width: 15),
                DropdownButton<String>(
                  value: initialVal,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  underline:
                      Container(height: 2, color: Colors.deepPurpleAccent),
                  onChanged: (String? newValue) {
                    setState(() {
                      initialVal = newValue!;
                    });
                  },
                  items: <String>[
                    'Hair-Cutting',
                    'Colouring and Styling',
                    'Nail Treatments',
                    'Massages',
                    'Skin Care Treatment'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  'Select Date for Appointment : ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Text(
                    "Date : ${date.day}:${date.month}:${date.year}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.yellow),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  'Select Time for Appointment : ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () {
                    _time();
                  },
                  child: Text(
                    "Time : ${time.hour}:${time.hour}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.yellow),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              ' Select Payment Method ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PaymentAlert(
                        firstController: mailController,
                        firstHeaderText: 'eMail',
                        secondController: carNumberController,
                        secondHeaderText: 'Card No',
                        thirdController: ccvController,
                        thirdHeaderText: 'CVV',
                        forthController: accHolderNameController,
                        forthHeadText: 'Account Holder',
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RouteManager.recieptPage);
                            },
                            child: const Text('Pay Now'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: const Text(' EFT Payment'),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Pay On Site'),
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                child: const Text('Payment on site'),
              ),
            ]),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.recieptPage);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }

  _time() async {
    TimeOfDay? timesSelected =
        await showTimePicker(context: context, initialTime: time);
    if (timesSelected != null) {
      setState(() {
        time = timesSelected;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDay,
        firstDate: DateTime(DateTime.now().month - 1),
        lastDate: DateTime(DateTime.now().year + 2));
    if (picked != null && picked != selectedDay) {
      setState(() {
        selectedDay = picked;
      });
    }
  }
}
