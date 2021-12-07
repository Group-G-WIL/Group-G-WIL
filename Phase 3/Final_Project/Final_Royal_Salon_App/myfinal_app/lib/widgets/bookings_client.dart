import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfinal_app/models/receipts.dart';
import 'package:myfinal_app/models/todo.dart';

import 'dialogs.dart';

class TraceBooking extends StatelessWidget {
  const TraceBooking({
    Key? key,
    required this.invoice,
    required this.deleteAction,
    required this.todoToggleAction,
  }) : super(key: key);
  final Invoice invoice;
  final Function() deleteAction;
  final Function(bool? value) todoToggleAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      shadowColor: Colors.blue,
      elevation: 12,
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            caption: 'Cancel',
            color: Colors.purple[600],
            icon: Icons.delete,
            onTap: deleteAction,
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Style name: ' + invoice.stylename,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Price: ' + invoice.price,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Date: ' + invoice.date, style: TextStyle(fontSize: 20))
                ],
              ),
              Row(
                children: [
                  Text('Time: ' + invoice.time, style: TextStyle(fontSize: 20))
                ],
              ),
              Row(
                children: [
                  Text(
                    'Booking number: ' + invoice.bookingnumber,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       showDialog(
              //         context: context,
              //         builder: (context) {
              //           return AlertDialog(
              //               titleTextStyle: const TextStyle(
              //                 fontSize: 20.0,
              //               ),
              //               content: const Text(
              //                   'Are you sure you want to Cancel your booking?'),
              //               actions: [
              //                 TextButton(
              //                   onPressed: () {
              //                     showSnackBar(context, 'Cancelled!');
              //                     Navigator.pop(context);
              //                   },
              //                   child: const Text(' NO '),
              //                 ),
              //                 TextButton(
              //                   onPressed: () {
              //                     showSnackBar(context, 'Deleted!');
              //                     deleteAction;
              //                   },
              //                   child: const Text(' Yes '),
              //                 ),
              //               ]);
              //         },
              //       );
              //     },
              //     child: Text('Cancel your booking'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
