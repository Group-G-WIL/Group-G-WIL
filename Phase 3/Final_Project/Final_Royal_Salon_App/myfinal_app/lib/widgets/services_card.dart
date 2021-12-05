import 'package:flutter/material.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/routes/routes.dart';

class DisplayServices extends StatelessWidget {
  const DisplayServices({
    Key? key,
    required this.todo,
  }) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyan,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'HairStyle name: ' + todo.title,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: todo.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Price: " + todo.title1,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: todo.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteManager.bookPage);
            },
            child: Text('Book'),
          ),
        ],
      ),
    );
  }
}
