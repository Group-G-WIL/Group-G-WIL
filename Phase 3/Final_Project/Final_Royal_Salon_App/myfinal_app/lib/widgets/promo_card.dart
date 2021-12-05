import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfinal_app/models/promo.dart';
import 'package:myfinal_app/models/todo.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    Key? key,
    required this.promo,
    required this.deleteAction,
    required this.todoToggleAction,
  }) : super(key: key);
  final Promo promo;
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
          value: promo.done,
          onChanged: todoToggleAction,
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    'HairStyle name: ' + promo.stylename,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: promo.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Discount: ' + promo.discount,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: promo.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Last day: " + promo.lastday,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: promo.done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
