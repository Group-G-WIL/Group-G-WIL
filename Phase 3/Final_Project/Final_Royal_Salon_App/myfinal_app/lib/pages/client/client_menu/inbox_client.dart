import 'package:myfinal_app/services/todo_service.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/app_progress_indicator.dart';
import 'package:myfinal_app/widgets/booking_salon.dart';
import 'package:myfinal_app/widgets/bookings_client.dart';
import 'package:myfinal_app/widgets/review_card.dart';
import 'package:provider/provider.dart' as provider;
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class RateNow extends StatelessWidget {
  const RateNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.red],
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rate your past services',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: provider.Consumer<TodoService>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.reviews.length,
                            itemBuilder: (context, index) {
                              return ReviewCard(
                                review: value.reviews[index],
                                todoToggleAction: (valueStatus) async {
                                  context
                                      .read<TodoService>()
                                      .toggleTodoDone(index);
                                },
                                deleteAction: () async {
                                  context
                                      .read<TodoService>()
                                      .deleteReview(value.reviews[index]);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            provider.Selector<UserService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.showUserProgress, value.userProgressText),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(text: value.item2)
                    : Container();
              },
            ),
            provider.Selector<TodoService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.busyRetrieving, value.busySaving),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(
                        text:
                            'Busy retrieving data from the database...please wait...')
                    : value.item2
                        ? AppProgressIndicator(
                            text:
                                'Busy saving data to the database...please wait...')
                        : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class AddSalonReviews extends StatelessWidget {
//   AddSalonReviews({Key? key}) : super(key: key);

//   final TextEditingController _commentsController = TextEditingController();

//   double calcRating(double total) {
//     double rating = 0.0;
//     rating = total / 3;
//     return rating;
//   }

//   double rate = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Text(
//               'Reviews List',
//               style: TextStyle(
//                 fontSize: 20.0,
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Text(
//                           'Ratings',
//                           style: TextStyle(
//                             fontSize: 20.0,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(width: 45),
//                           Text('Categories'),
//                           SizedBox(width: 120),
//                           Text('Rating'),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Column(
//                               children: [
//                                 Text('Hygiene'),
//                                 Text('Hairstyle'),
//                                 Text('Experience'),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Column(
//                               children: [
//                                 RatingBar.builder(
//                                   initialRating: 3,
//                                   minRating: 1,
//                                   direction: Axis.horizontal,
//                                   allowHalfRating: false,
//                                   itemCount: 5,
//                                   itemPadding:
//                                       EdgeInsets.symmetric(horizontal: 1.0),
//                                   itemBuilder: (context, _) => Icon(
//                                     Icons.star,
//                                     color: Colors.amber,
//                                   ),
//                                   onRatingUpdate: (rating) {
//                                     rate += rating;
//                                   },
//                                 ),
//                                 RatingBar.builder(
//                                   initialRating: 3,
//                                   minRating: 1,
//                                   direction: Axis.horizontal,
//                                   allowHalfRating: false,
//                                   itemCount: 5,
//                                   itemPadding:
//                                       EdgeInsets.symmetric(horizontal: 1.0),
//                                   itemBuilder: (context, _) => Icon(
//                                     Icons.star,
//                                     color: Colors.amber,
//                                   ),
//                                   onRatingUpdate: (rating) {
//                                     rate += rating;
//                                   },
//                                 ),
//                                 RatingBar.builder(
//                                   initialRating: 3,
//                                   minRating: 1,
//                                   direction: Axis.horizontal,
//                                   allowHalfRating: false,
//                                   itemCount: 5,
//                                   itemPadding:
//                                       EdgeInsets.symmetric(horizontal: 1.0),
//                                   itemBuilder: (context, _) => Icon(
//                                     Icons.star,
//                                     color: Colors.amber,
//                                   ),
//                                   onRatingUpdate: (rating) {
//                                     rate += rating;
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text('Comments'),
//                       TextFormField(
//                         autocorrect: true,
//                         controller: _commentsController,
//                         textCapitalization: TextCapitalization.sentences,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           calcRating(rate);
//                         },
//                         child: Text('Save'),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class StarDisplay extends StatelessWidget {
//   final int value;

//   const StarDisplay({Key? key, this.value = 0})
//       : assert(value != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(5, (index) {
//         return Icon(
//           index < value ? Icons.star : Icons.star_border,
//         );
//       }),
//     );
//   }
// }
