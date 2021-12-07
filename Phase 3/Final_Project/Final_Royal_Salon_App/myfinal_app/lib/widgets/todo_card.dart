import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfinal_app/models/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
    required this.todo,
    required this.deleteAction,
    required this.todoToggleAction,
  }) : super(key: key);
  final Todo todo;
  final Function() deleteAction;
  final Function(bool? value) todoToggleAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade300,
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
        child: CheckboxListTile(
          checkColor: Colors.purple,
          activeColor: Colors.purple[100],
          value: todo.done,
          onChanged: todoToggleAction,
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    'HairStyle name: ' + todo.title,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: todo.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Price: " + todo.title1,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: todo.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120.0),
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
