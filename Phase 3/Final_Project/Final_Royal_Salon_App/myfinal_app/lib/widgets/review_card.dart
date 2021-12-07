import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myfinal_app/models/promo.dart';
import 'package:myfinal_app/models/rev.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/services/helper_home.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.review,
    required this.deleteAction,
    required this.todoToggleAction,
  }) : super(key: key);
  final Review review;
  final Function() deleteAction;
  final Function(bool? value) todoToggleAction;

  @override
  Widget build(BuildContext context) {
    int star11, star21, star31, star41, star51;
    int star1, star2, star3, star4, star5;
    int temp = 0;

    int temp1 = 0;
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
                    'Salon name: ' + review.salonname,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Style name: ' + review.stylename,
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
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Experience',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          temp = 1;
                        },
                        icon: Icon(Icons.star),
                      ),
                      IconButton(
                        onPressed: () {
                          temp = 2;
                        },
                        icon: Icon(Icons.star),
                      ),
                      IconButton(
                        onPressed: () {
                          temp = 3;
                        },
                        icon: Icon(Icons.star),
                      ),
                      IconButton(
                        onPressed: () {
                          temp = 4;
                        },
                        icon: Icon(Icons.star),
                      ),
                      IconButton(
                        onPressed: () {
                          temp = 5;
                        },
                        icon: Icon(Icons.star),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HairStyle',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          temp1 = 1;
                        },
                        icon: Icon(Icons.star),
                      ),
                      IconButton(
                        onPressed: () {
                          temp1 = 2;
                        },
                        icon: Icon(Icons.star),
                      ),
                      IconButton(
                        onPressed: () {
                          temp1 = 3;
                        },
                        icon: Icon(Icons.star),
                      ),
                      IconButton(
                        onPressed: () {
                          temp1 = 4;
                        },
                        icon: Icon(Icons.star),
                      ),
                      IconButton(
                        onPressed: () {
                          temp1 = 5;
                        },
                        icon: Icon(Icons.star),
                      ),
                    ],
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    createNewCommentInUI(context,
                        stylename: review.stylename,
                        rate1: temp.toString(),
                        rate2: temp.toString(),
                        comment1: '');
                    saveAllTodosInUI(context);
                  },
                  child: Text('Submit'))
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
// import 'package:myfinal_app/models/favou.dart';
// import 'package:myfinal_app/models/receipts.dart';
// import 'package:myfinal_app/models/rev.dart';
// import 'package:myfinal_app/models/temp.dart';
// import 'package:myfinal_app/models/todo.dart';
// import 'package:myfinal_app/routes/routes.dart';
// import 'package:myfinal_app/services/helper_home.dart';

// import 'dialogs.dart';

// class ReviewCard extends StatelessWidget {
//   const ReviewCard({
//     Key? key,
//     required this.review,
//     required this.deleteAction,

//     // required this.todoToggleAction,
//   }) : super(key: key);
//   final Review review;

//   final Function() deleteAction;

//   // final Function(bool? value) todoToggleAction;
// //Temp temp;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.blue[200],
//       shadowColor: Colors.blue,
//       elevation: 12,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Text(
//                   'Salon name: ' + review.salonname,
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Text(
//                   'Style name: ' + review.stylename,
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ],
//             ),
//             Row(
//               children: [Text('Catagories'), Text('Rates')],
//             ),
//             Row(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Comment',
//                     labelStyle: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   createNewCommentInUI(context,
//                       stylename: review.stylename,
//                       rate1: '',
//                       rate2: '',
//                       comment1: '');
//                 },
//                 child: Text('Submit'))
//           ],
//         ),
//       ),
//     );
//   }
// }
