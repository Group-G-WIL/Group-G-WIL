import 'package:flutter/material.dart';
import 'package:myfinal_app/pages/client/booking_process/receipt.dart';
import 'package:myfinal_app/pages/client/client_menu/bookings.dart';
import 'package:myfinal_app/routes/routes.dart';
import 'dart:math';
import 'package:myfinal_app/widgets/payment_Alert.dart';

class BookNow extends StatefulWidget {
  const BookNow({
    Key? key,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  final String title1;
  final String title2;
  @override
  State<BookNow> createState() => _BookNowState(title1, title2);
}

class _BookNowState extends State<BookNow> {
  String title1, title2;

  _BookNowState(this.title1, this.title2);

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

      body: Card(
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
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
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
                      padding: const EdgeInsets.only(left: 20),
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
                    const SizedBox(width: 20),
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
                        "Time : ${time.hour}:${time.minute}",
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

                    Booking(
                      title1: number,
                      name: title1,
                      time: '${time.hour}:${time.minute}',
                      date: '${date.day}:${date.month}:${date.year}',
                      price: title2,
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
