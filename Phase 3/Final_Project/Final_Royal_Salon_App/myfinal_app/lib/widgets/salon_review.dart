import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfinal_app/models/comm.dart';
import 'package:myfinal_app/models/favou.dart';
import 'package:myfinal_app/models/receipts.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/routes/routes.dart';

import 'dialogs.dart';

class RCard extends StatelessWidget {
  const RCard({
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
          child: ListTile(
            title: Text('Hairstyle: ' + comment.rate2),
            trailing: Text('Style Name: ' + comment.stylename),
            subtitle: Text('Experience: ' + comment.rate1),
            leading: Text('Ratings'),
          )),
    );
  }
}
