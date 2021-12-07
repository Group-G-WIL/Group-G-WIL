import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfinal_app/models/favou.dart';
import 'package:myfinal_app/models/receipts.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/routes/routes.dart';

import 'dialogs.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    Key? key,
    required this.favourite,
    required this.deleteAction,
    required this.todoToggleAction,
  }) : super(key: key);
  final Favourite favourite;

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
            caption: 'Delete',
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
                    'Salon name: ' + favourite.stylename,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Salon Location: ' + favourite.salonadress,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
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
                      child: const Text('Services'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RouteManager.reviewsPage);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      child: const Text('View Reviews'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RouteManager.getDirectionsPage);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      child: const Text('Get Directions'),
                    ),
                  ],
                ),
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
              //                   'Are you sure you want to delete this?'),
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
              //                     deleteAction;
              //                     Navigator.pop(context);
              //                     showSnackBar(context, 'Deleted!');
              //                   },
              //                   child: const Text(' Yes '),
              //                 ),
              //               ]);
              //         },
              //       );
              //     },
              //     child: Text('Delete'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
