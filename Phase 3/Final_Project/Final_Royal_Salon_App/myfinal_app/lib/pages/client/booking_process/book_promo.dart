import 'package:flutter/material.dart';
import 'package:myfinal_app/pages/client/booking_process/receipt.dart';
import 'package:myfinal_app/pages/client/client_menu/bookings.dart';
import 'package:myfinal_app/routes/routes.dart';
import 'package:myfinal_app/services/helper_home.dart';
import 'dart:math';
import 'package:myfinal_app/widgets/payment_Alert.dart';

class BookNow1 extends StatefulWidget {
  const BookNow1({
    Key? key,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  final String title1;
  final String title2;

  @override
  State<BookNow1> createState() => _BookNow1State(title1, title2);
}

class _BookNow1State extends State<BookNow1> {
  String title1, title2;

  _BookNow1State(this.title1, this.title2);

  late String initialVal = 'Payment Option';
  late DateTime date;
  late TimeOfDay time;
  late DateTime selectedDay;
  late int number = 0;

  @override
  void initState() {
    super.initState();

    date = DateTime.now();
    time = TimeOfDay.now();
    selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
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
      ),
      //

      body: SingleChildScrollView(
        child: Card(
          child: Container(
            color: Colors.cyan[200],
            height: 360,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17, bottom: 10),
                        child: Text(
                          'HairStyle name: ' + title1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Text(
                          'HairStyle Price: ' + title2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurpleAccent),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 17),
                      const Text(
                        'Select Date for Appointment : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent),
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
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //
                  Row(
                    children: [
                      const SizedBox(width: 17),
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
                          "Time : ${time.hour}:${time.minute}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow),
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<String>(
                          value: initialVal,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                          underline: Container(
                              height: 2, color: Colors.deepPurpleAccent),
                          onChanged: (String? newValue) {
                            setState(() {
                              initialVal = newValue!;
                            });
                          },
                          items: <String>[
                            'Payment Option',
                            'Credit Card',
                            'Cash',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
                      number = Random().nextInt(100) + 1;

                      createNewInvoiceInUI(context,
                          stylename: title1,
                          price: title2,
                          bookingnumber: number.toString(),
                          date: '${date.day}:${date.month}:${date.year}',
                          time: '${time.hour}:${time.minute}');
                      saveAllinvoiceInUI(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reciept(
                            title: title1,
                            title1: title2,
                            date: '${date.day}:${date.month}:${date.year}',
                            time: '${time.hour}:${time.minute}',
                            booknumber: number,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    child: const Text('Book Now'),
                  ),
                ],
              ),
            ),
          ),
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
        initialDate: date,
        firstDate: DateTime(DateTime.now().month - 1),
        lastDate: DateTime(DateTime.now().year + 2));
    if (picked != null && picked != selectedDay) {
      setState(() {
        date = picked;
      });
    }
  }
}
