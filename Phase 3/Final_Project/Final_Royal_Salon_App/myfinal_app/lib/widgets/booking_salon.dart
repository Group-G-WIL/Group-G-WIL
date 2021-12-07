import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfinal_app/models/receipts.dart';
import 'package:myfinal_app/models/rev.dart';
import 'package:myfinal_app/models/temp.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/services/helper_home.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:provider/src/provider.dart';

import 'dialogs.dart';

class BookingListCard extends StatefulWidget {
  const BookingListCard({
    Key? key,
    required this.invoice,
    required this.deleteAction,
    required this.todoToggleAction,
  }) : super(key: key);
  final Invoice invoice;
  final Function() deleteAction;
  final Function(bool? value) todoToggleAction;
  @override
  _BookingListCardState createState() =>
      _BookingListCardState(deleteAction, invoice, todoToggleAction);
}

class _BookingListCardState extends State<BookingListCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Invoice invoice;
  final Function() deleteAction;
  final Function(bool? value) todoToggleAction;
  _BookingListCardState(this.deleteAction, this.invoice, this.todoToggleAction);
  @override
  Widget build(BuildContext context) {
    String name = context.read<UserService>().currentUser!.getProperty('name');
    String Salonname =
        context.read<UserService>().currentUser!.getProperty('salon_name');
    return Card(
      color: Colors.blue[200],
      shadowColor: Colors.blue,
      elevation: 12,
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
              caption: 'Send',
              color: Colors.purple[600],
              icon: Icons.delete,
              onTap: deleteAction),
        ],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Client name: ' + name,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
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
              ElevatedButton(
                  onPressed: () {
                    createNewReviewInUI(context,
                        stylename: invoice.stylename,
                        salonname: Salonname,
                        rate1: '',
                        rate2: '',
                        comment: '');
                    createNewTempInUI(context,
                        stylename: invoice.stylename, salonname: Salonname);
                    // saveAlldoneInUI(context);
                  },
                  child: Text('Send a massage for reviews'))
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
              //                   'Are you sure you are done styling your Client?'),
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
              //                     setState(() {
              //                       createNewReviewInUI(context,
              //                           stylename: invoice.stylename,
              //                           salonname: Salonname,
              //                           rate1: '',
              //                           rate2: '',
              //                           comment: '');
              //                       createNewTempInUI(context,
              //                           stylename: invoice.stylename,
              //                           salonname: Salonname);
              //                       saveAlldoneInUI(context);
              //                       Navigator.pop(context);
              //                       deleteAction;

              //                       showSnackBar(context, 'Deleted!');
              //                     });
              //                   },
              //                   child: const Text(' Yes '),
              //                 ),
              //               ]);
              //         },
              //       );
              //     },
              //     child: Text('Remove'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}














// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:myfinal_app/models/receipts.dart';
// import 'package:myfinal_app/models/rev.dart';
// import 'package:myfinal_app/models/temp.dart';
// import 'package:myfinal_app/models/todo.dart';
// import 'package:myfinal_app/services/helper_home.dart';
// import 'package:myfinal_app/services/user_service.dart';
// import 'package:provider/src/provider.dart';

// import 'dialogs.dart';

// class BookingListCard extends StatelessWidget {
//   const BookingListCard({
//     Key? key,
//     required this.invoice,
//     required this.deleteAction,
//     required this.todoToggleAction,
//   }) : super(key: key);
//   final Invoice invoice;
//   final Function() deleteAction;
//   final Function(bool? value) todoToggleAction;

//   @override
//   Widget build(BuildContext context) {
//     String name = context.read<UserService>().currentUser!.getProperty('name');
//     String Salonname =
//         context.read<UserService>().currentUser!.getProperty('salon_name');
//     return Card(
//       color: Colors.blue[200],
//       shadowColor: Colors.blue,
//       elevation: 12,
//       child: Slidable(
//         actionPane: SlidableDrawerActionPane(),
//         secondaryActions: [
//           IconSlideAction(
//             caption: 'Delete',
//             color: Colors.purple[600],
//             icon: Icons.delete,
//             onTap: () {
              
//             },
//           ),
//         ],
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     'Client name: ' + name,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Style name: ' + invoice.stylename,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Price: ' + invoice.price,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text('Date: ' + invoice.date, style: TextStyle(fontSize: 20))
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text('Time: ' + invoice.time, style: TextStyle(fontSize: 20))
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Booking number: ' + invoice.bookingnumber,
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ],
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: ElevatedButton(
//               //     onPressed: () {
//               //       showDialog(
//               //         context: context,
//               //         builder: (context) {
//               //           return AlertDialog(
//               //               titleTextStyle: const TextStyle(
//               //                 fontSize: 20.0,
//               //               ),
//               //               content: const Text(
//               //                   'Are you sure you are done styling your Client?'),
//               //               actions: [
//               //                 TextButton(
//               //                   onPressed: () {
//               //                     showSnackBar(context, 'Cancelled!');
//               //                     Navigator.pop(context);
//               //                   },
//               //                   child: const Text(' NO '),
//               //                 ),
//               //                 TextButton(
//               //                   onPressed: () {
//               //                     createNewReviewInUI(context,
//               //                         stylename: invoice.stylename,
//               //                         salonname: Salonname,
//               //                         rate1: '',
//               //                         rate2: '',
//               //                         comment: '');
//               //                     createNewTempInUI(context,
//               //                         stylename: invoice.stylename,
//               //                         salonname: Salonname);
//               //                     saveAllTodosInUI(context);
//               //                     showSnackBar(context, 'Deleted!');

//               //                     deleteAction;
//               //                   },
//               //                   child: const Text(' Yes '),
//               //                 ),
//               //               ]);
//               //         },
//               //       );
//               //     },
//               //     child: Text('Remove'),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
