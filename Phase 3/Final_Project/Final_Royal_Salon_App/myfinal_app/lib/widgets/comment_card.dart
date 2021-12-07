import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfinal_app/models/comm.dart';
import 'package:myfinal_app/models/favou.dart';
import 'package:myfinal_app/models/receipts.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/routes/routes.dart';

import 'dialogs.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
    required this.comment,
    required this.deleteAction,
    // required this.todoToggleAction,
  }) : super(key: key);
  final Comment comment;

  final Function() deleteAction;
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
                  'Style name: ' + comment.stylename,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Catagories',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rates',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Experience',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${comment.rate1}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'HairStyle',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${comment.rate2}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
