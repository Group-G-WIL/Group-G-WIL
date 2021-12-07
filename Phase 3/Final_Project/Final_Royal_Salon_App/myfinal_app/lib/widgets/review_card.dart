import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfinal_app/models/favou.dart';
import 'package:myfinal_app/models/receipts.dart';
import 'package:myfinal_app/models/rev.dart';
import 'package:myfinal_app/models/temp.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/routes/routes.dart';

import 'dialogs.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(
      {Key? key,
      required this.review,
      required this.deleteAction,
      required this.temp
      // required this.todoToggleAction,
      })
      : super(key: key);
  final Review review;

  final Function() deleteAction;
  final Temp temp;
  // final Function(bool? value) todoToggleAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[200],
      shadowColor: Colors.blue,
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Salon name: ' + temp.salonname,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Style name: ' + temp.stylename,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              children: [Text('Catagories'), Text('Rates')],
            ),
            Row(
              children: [
                Text(
                  'Comments: ',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
